# Agents, MCP & Skills

En praktisk workshop hvor vi udforsker den nye verden af agentic software engineering.

En konsulent fra Context& guider jer igennem arkitekturen bag agents, Model Context Protocol (MCP) og Skills – med hands-on øvelser i hvert modul.

## Agenda (ca. 3,5 timer)

| Tid | Emne |
|-----|------|
| 5 min | Opsummering fra sidste gang |
| 5 min | Intro til Polyglot Notebooks |
| 15 min | Det agentiske landskab – overblik |
| 55 min | **Byg en Agent** – teori + øvelse |
| 15 min | *Pause* |
| 50 min | MCP-servere – teori + øvelse |
| 45 min | Skills – teori + øvelse |
| 25 min | Integration – sæt det hele sammen – teori + øvelse |
| 5 min | Afrunding |

## Forberedelse

Installer venligst inden workshoppen:

- VS Code
- Polyglot Notebooks extension (men .NET Extension Pack er nemmest)
- .NET 8 SDK eller nyere
- **Ollama** – lokal LLM inference
  - Installer: `winget install Ollama.Ollama`
  - Download model: `ollama pull llama3.1:8b`
  - Verificer: `ollama list` (skal vise llama3.1:8b)
- GitHub Copilot (NB. Ikke påkrævet.)

## Domæne

Vi arbejder med et fiktivt EV-ladenetværk som case.
