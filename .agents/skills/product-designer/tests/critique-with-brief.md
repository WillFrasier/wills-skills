# Test: critique skips intake when a brief exists

## Input

"Crit this," with a screenshot of the home page. An approved brief exists at `./design/pages/home.md`.

## Expected behavior

- Uses the brief as the confirmed brief: no intake questions, no brief playback.
- Goes straight to the critique output format.
- Cites brief fields and wisdom IDs as evidence.
