# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Commands

```bash
# Test notebook (requires Ollama running with llama3.1:8b)
./test-agents-mcp-skills.ps1

# Regenerate SVG from Mermaid source
npx -y @mermaid-js/mermaid-cli -i images/file.mmd -o images/file.svg
```

## Language / Sprog

**VIGTIGT:** Workshop-notebooks (`agents-mcp-skills.dib`, `playground.dib`) skal skrives på **dansk**.

- Al prosa, instruktioner og forklaringer skal være på dansk
- Tekniske termer på engelsk er OK (f.eks. "tool", "agent", "MCP", "skill", "loop")
- Kodekommentarer kan være på engelsk eller dansk
- Overskrifter og sektion-titler skal være på dansk

Eksempel:
- ✅ "Vi definerer et `create_file` tool, som giver LLM'en mulighed for..."
- ❌ "We define a `create_file` tool that allows the LLM to..."

## Repository Overview

Workshop materials for agentic software engineering practices using Polyglot Notebooks (.dib files) with C# and .NET Interactive kernel.

**Notebooks:**
- `agents-mcp-skills.dib` - Main workshop (3.5 hours): agents, MCP, skills
- `playground.dib` - Scratch space for experimentation

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
- `OllamaSharp` (5.1.3) - Local LLM inference via Ollama (implements IChatClient)
- `ModelContextProtocol` (0.5.0-preview.1) - MCP server & client SDK
- `Microsoft.Extensions.AI` (9.1.0-preview) - AI abstraction layer (IChatClient, AITool)
- `Microsoft.Extensions.Hosting` (8.0.0) - Dependency injection

**Note:** OllamaSharp implements `IChatClient` from Microsoft.Extensions.AI, enabling seamless MCP tool integration via `ChatClientBuilder.UseFunctionInvocation()`.

## Polyglot Notebook Format

Each `.dib` file contains cell types:
- `#!meta` - Kernel configuration (JSON)
- `#!markdown` - Documentation cells
- `#!csharp` - C# code cells (executed in shared kernel session)

Variables persist across cells within a session. Run cells with Shift+Enter (run and advance) or Ctrl+Enter (run and stay).

## Mermaid Diagrams

Source files (`.mmd`) in `images/` folder are rendered to SVG for display in notebooks.

**IMPORTANT**: Never delete `.mmd` source files! They are the source of truth.

Diagrams: `agentic-loop.mmd`, `ai-training-loop.mmd`, `agent-sdk-landscape.mmd`, `mcp-problem.mmd`, `mcp-solution.mmd`, `metr-timeline.mmd`

## Testing

When modifying code cells in `agents-mcp-skills.dib`, run `./test-agents-mcp-skills.ps1` before committing. Requires Ollama running with `llama3.1:8b` model. Only commit if exit code is 0.
