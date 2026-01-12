# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains workshop materials for agentic software engineering practices. Workshops are designed for hands-on learning with Polyglot Notebooks (.dib files). Primary language is C# with .NET Interactive kernel.

## Prerequisites

- .NET 9 SDK (required for OllamaSharp 5.x)
- VS Code with Polyglot Notebooks extension (or full .NET Extension Pack)
- **Ollama** for local LLM inference:
  ```bash
  winget install Ollama.Ollama
  ollama pull llama3.1:8b
  ollama serve  # Start the server
  ```

## Workshop: Agents, MCP & Skills

The main workshop (`agents-mcp-skills.dib`) is a 3.5-hour hands-on session covering:
1. **Byg en Agent** - Implementing the agentic loop (~200 lines of code)
2. **MCP-servere** - Model Context Protocol for standardized tool access
3. **Skills** - Reusable domain knowledge for AI agents
4. **Integration** - Wiring all components together

### Domain: ChargeSmart EV Network

Exercises use a fictional EV charging network in Copenhagen:
- 10 charging stations (IDs: CPH-001 through CPH-010)
- Power levels: slow (7kW), fast (50kW), ultra-fast (150kW)
- Tariff structure: off-peak (1.50 DKK/kWh), normal (2.50 DKK/kWh), peak (4.00 DKK/kWh)

## Key NuGet Packages Used

The workshop notebook references:
- `OllamaSharp` (5.1.3) - Local LLM inference via Ollama
- `ModelContextProtocol` (0.1.0-preview.15) - MCP server SDK
- `Microsoft.Extensions.Hosting` (8.0.0) - Dependency injection

## Polyglot Notebook Format

Each `.dib` file contains cell types:
- `#!meta` - Kernel configuration (JSON)
- `#!markdown` - Documentation cells
- `#!csharp` - C# code cells (executed in shared kernel session)

Variables persist across cells within a session. Run cells with Shift+Enter (run and advance) or Ctrl+Enter (run and stay).

## Mermaid Diagrams

Source files (`.mmd`) in `images/` folder are rendered to SVG for display in notebooks.

**IMPORTANT**: Never delete `.mmd` source files! They are the source of truth.

To regenerate after editing a `.mmd` file:
```bash
npx -y @mermaid-js/mermaid-cli -i file.mmd -o file.svg
```

## Git Workflow

```bash
git add -A
git commit -m "feat: description"
# Note: git push is handled by user (production deployment decision)
```
