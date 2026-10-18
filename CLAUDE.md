@GEMINI.md

## Claude Code specifics
- The review gate of `GEMINI.md`: dispatch the `isne-code-reviewer` agent (`.claude/agents/isne-code-reviewer.md`) with the Agent tool, giving the country name, TAG and plan file path. The researchers `isne-historical-researcher` and `isne-audit-researcher` are dispatched the same way; their briefs set their model, tools and budgets.
