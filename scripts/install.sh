#!/usr/bin/env bash
# Install or update this repo's skills globally without clobbering user config.
#
# Usage: scripts/install.sh [--dry-run] [skill ...]
#
# Copies .agents/skills/<name>/ into $AGENTS_SKILLS_DIR (default ~/.agents/skills)
# and symlinks each into $CLAUDE_SKILLS_DIR (default ~/.claude/skills).
#
# Safety rules:
# - A manifest (.wills-skills-manifest) in each installed skill records the hash
#   of every file as last installed. A file whose hash no longer matches was
#   edited by the user.
# - references/app-context.md is user config: once edited it is never touched.
#   If unedited, it is updated like any other file.
# - Any other edited file is backed up to $BACKUP_DIR before being updated.
# - Files removed upstream are deleted only if unedited. User-added files stay.
# - Skills managed by `npx skills` (listed in ~/.agents/.skill-lock.json) and
#   existing non-matching entries in the Claude skills dir are left alone.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$REPO_ROOT/.agents/skills"
AGENTS_SKILLS_DIR="${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}"
CLAUDE_SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
LOCK_FILE="${LOCK_FILE:-$HOME/.agents/.skill-lock.json}"
BACKUP_DIR="${BACKUP_DIR:-$HOME/.agents/skills-backups/$(date +%Y%m%d-%H%M%S)}"
MANIFEST=".wills-skills-manifest"
PROTECTED="references/app-context.md"

DRY_RUN=0
SKILLS=()
for arg in "$@"; do
  case "$arg" in
    -n|--dry-run) DRY_RUN=1 ;;
    -h|--help) sed -n '2,18p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    -*) echo "Unknown option: $arg" >&2; exit 2 ;;
    *) SKILLS+=("$arg") ;;
  esac
done

if [ ${#SKILLS[@]} -eq 0 ]; then
  for d in "$SRC_DIR"/*/; do SKILLS+=("$(basename "$d")"); done
fi

run() { if [ "$DRY_RUN" -eq 1 ]; then echo "    [dry-run] $*"; else "$@"; fi; }
hash_of() { shasum -a 256 "$1" | awk '{print $1}'; }
# Hash recorded for a path in a manifest, or empty.
manifest_hash() { [ -f "$1" ] && awk -v p="$2" '$2 == p {print $1; exit}' "$1" || true; }

in_lock_file() {
  [ -f "$LOCK_FILE" ] || return 1
  python3 - "$LOCK_FILE" "$1" <<'PY'
import json, sys
sys.exit(0 if sys.argv[2] in json.load(open(sys.argv[1])).get("skills", {}) else 1)
PY
}

backup() {
  local name="$1" rel="$2"
  run mkdir -p "$(dirname "$BACKUP_DIR/$name/$rel")"
  run cp -p "$AGENTS_SKILLS_DIR/$name/$rel" "$BACKUP_DIR/$name/$rel"
  echo "    backed up edited $rel -> $BACKUP_DIR/$name/$rel"
}

install_skill() {
  local name="$1"
  local src="$SRC_DIR/$name" dest="$AGENTS_SKILLS_DIR/$name"
  local old_manifest="$dest/$MANIFEST" new_manifest
  new_manifest="$(mktemp)"

  if [ ! -f "$src/SKILL.md" ]; then
    echo "!! $name: no SKILL.md in $src, skipping" >&2; return
  fi
  if in_lock_file "$name"; then
    echo "!! $name: managed by 'npx skills' (in $LOCK_FILE), skipping" >&2; return
  fi

  echo "== $name"
  [ -d "$dest" ] || run mkdir -p "$dest"

  # Copy or update every file from the repo.
  local rel src_hash dest_hash last_hash
  while IFS= read -r rel; do
    src_hash="$(hash_of "$src/$rel")"
    last_hash="$(manifest_hash "$old_manifest" "$rel")"

    if [ ! -e "$dest/$rel" ]; then
      run mkdir -p "$(dirname "$dest/$rel")"
      run cp -p "$src/$rel" "$dest/$rel"
      echo "    added $rel"
      echo "$src_hash  $rel" >> "$new_manifest"
      continue
    fi

    dest_hash="$(hash_of "$dest/$rel")"
    if [ "$dest_hash" = "$src_hash" ]; then
      echo "$src_hash  $rel" >> "$new_manifest"
      continue
    fi

    if [ "$dest_hash" != "$last_hash" ] && [ "$rel" = "$PROTECTED" ]; then
      echo "    kept your edited $rel (differs from repo; compare: diff '$dest/$rel' '$src/$rel')"
      # Keep the old hash so the file still reads as user-edited next run.
      [ -n "$last_hash" ] && echo "$last_hash  $rel" >> "$new_manifest"
      continue
    fi

    [ "$dest_hash" != "$last_hash" ] && backup "$name" "$rel"
    run cp -p "$src/$rel" "$dest/$rel"
    echo "    updated $rel"
    echo "$src_hash  $rel" >> "$new_manifest"
  done < <(cd "$src" && find . -type f ! -name .DS_Store | sed 's|^\./||' | sort)

  # Remove files we installed earlier that upstream has dropped, unless edited.
  if [ -f "$old_manifest" ]; then
    while read -r last_hash rel; do
      [ -e "$src/$rel" ] || [ ! -e "$dest/$rel" ] && continue
      if [ "$(hash_of "$dest/$rel")" = "$last_hash" ]; then
        run rm "$dest/$rel"
        echo "    removed $rel (dropped upstream)"
      else
        echo "    kept $rel (dropped upstream, but you edited it)"
      fi
    done < "$old_manifest"
  fi

  if [ "$DRY_RUN" -eq 1 ]; then rm "$new_manifest"; else mv "$new_manifest" "$old_manifest"; fi

  # Expose the skill to Claude Code.
  local link="$CLAUDE_SKILLS_DIR/$name" target="../../.agents/skills/$name"
  [ "$AGENTS_SKILLS_DIR" = "$HOME/.agents/skills" ] || target="$dest"
  if [ -L "$link" ]; then
    local current; current="$(readlink "$link")"
    if [ "$current" != "$target" ] && [ "$current" != "$dest" ]; then
      echo "!! $name: $link already points to $current, leaving it" >&2
    fi
  elif [ -e "$link" ]; then
    echo "!! $name: $link exists and is not a symlink, leaving it" >&2
  else
    run mkdir -p "$CLAUDE_SKILLS_DIR"
    run ln -s "$target" "$link"
    echo "    linked $link -> $target"
  fi
}

[ "$DRY_RUN" -eq 1 ] && echo "Dry run: no changes will be made."
for name in "${SKILLS[@]}"; do install_skill "$name"; done
[ -d "$BACKUP_DIR" ] && echo "Backups of edited files: $BACKUP_DIR"
exit 0
