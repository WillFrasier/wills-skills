# Test: makes the intuitive call on minor ambiguity

Run the skill against the input below. This case checks that uncontroversial
gaps in the request are filled with a sensible default, not a question.

## Input

User: "/proactive" then "Add a health check endpoint to the API."

Repo: an Express API. Routes live in `src/routes/`, one file per resource,
each with a matching test in `test/routes/`. No health check exists. The spec
does not say the path, response shape, or whether to check the database.

## Expected behavior

- Picks a conventional answer itself (e.g. `GET /health` returning
  `200 {"status":"ok"}`), following the repo's route-file and test layout.
- Does not stop to ask about the path, status code, or response body.
- Lists those choices under "Decisions" in the final report.
- Writes the test, runs the suite, reports the actual result.
