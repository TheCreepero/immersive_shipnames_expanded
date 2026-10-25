# Contributing

This page describes how to contribute new ship namelists or expand existing ones in the ISNE project.

---

## Quick Start

1. **Clone the repository:**
   ```
   git clone https://github.com/TheCreepero/immersive_shipnames_expanded.git
   ```
2. **Set up a dev link** so changes are live in your Paradox launcher immediately:
   ```powershell
   powershell -File .\build.ps1 -DevLink
   ```
3. **Validate** before committing:
   ```powershell
   powershell -File .\build.ps1 -ValidateOnly
   ```
4. **Run tests**:
   ```powershell
   powershell -File .\build.ps1 -Test
   ```

---

## AI Agent Configuration

ISNE is developed with AI coding agents. The project rules exist once, in `AGENTS.md` (short form) and `docs/isne-agent-guide.md` (long form); `CLAUDE.md` and `GEMINI.md` import `AGENTS.md`. The two skills exist as mirrored copies and the subagent briefs once:

| Agent | Rule file | Skills | Subagents |
|---|---|---|---|
| Google Antigravity | `GEMINI.md` | `.agents/skills/hoi4-isne-ship-namelist-authoring/SKILL.md`, `.agents/skills/hoi4-isne-namelist-audit/SKILL.md` | The briefs in `.claude/agents/`, passed by path to `invoke_subagent` |
| Claude Code | `CLAUDE.md` | `.claude/skills/hoi4-isne-ship-namelist-authoring/SKILL.md`, `.claude/skills/hoi4-isne-namelist-audit/SKILL.md` | `.claude/agents/isne-historical-researcher.md`, `isne-audit-researcher.md`, `isne-code-reviewer.md`, dispatched by name |

When a rule or runbook step changes, update both sides of the mirror in the same change. Only tool-specific wording (how subagents are dispatched) should differ.

---

## File Structure

All ship namelist files live in:
```
common/units/names_ships/<TAG>_ship_names.txt
```

---

## Authoring a New Ship Namelist

### Step 1 — Research

Before writing:
- **Historical Navy Lists**: Research historical combatants, planned ships, cancelled classes, and unbuilt naval expansion programs (e.g. Two-Ocean Navy Act, Z-Plan, Project 23, 1938 Naval Program).
- **Class Naming Conventions**: Did the nation name battleships after provinces/states? Cruisers after cities? Destroyers after naval heroes, winds, rivers, or virtues?
- **Prefixes**: Does the navy use an official ship prefix (e.g., *USS*, *HMS*, *ORP*)?
- **Alternate History**: What naming schemes would a growing naval power employ?

### Step 2 — Check Vanilla Coverage

Use the build script to inspect vanilla lists:
```powershell
powershell -File .\build.ps1 -InspectVanilla SWE
powershell -File .\build.ps1 -InspectVanilla ENG -Group ENG_DD_HISTORICAL
```

### Step 3 — Write the Namelist

- Encode strictly in **UTF-8 without BOM**.
- Ensure matching braces `{}` and quotes `"`.
- Keep group display names (`name = "..."`) concise (**<= 25–30 characters**, max 32) and omit redundant country names so names fit the Ship Designer dropdown UI cleanly.
- Verify every group has a `fallback_name` with `%d` or `%s`.
- Run validation:
  ```powershell
  powershell -File .\build.ps1 -ValidateOnly
  ```

### Step 4 — Sizing & Namelist Depth Standards

Because smaller combat vessels are built in high volumes during Hearts of Iron IV campaigns, namelists must provide sufficient depth so wartime fleets do not exhaust names into generic numbered templates:
- **Destroyers & Escorts (`DD`)**: 100–140+ unique names (minimum 80+ for minor navies).
- **Submarines (`SS`)**: 60–80+ unique names (minimum 50+ for minor navies).
- **Light Cruisers (`CL`)**: 50–70+ unique names (minimum 40–45+ for minor navies).
- **Heavy Cruisers & Coastal Defense (`CA`)**: 35–45+ unique names.
- **Capital Ships (`BB` / `BC`)**: 30–45+ unique names.
- **Aircraft Carriers (`CV`)**: 30–40+ unique names.
- **Universal Thematic Pools**: 35–60+ unique names per pool where thematic scope permits.
