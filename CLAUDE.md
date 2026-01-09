# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains workshop materials for agentic software engineering practices. Workshops are designed for hands-on learning with Polyglot Notebooks (.dib files).

## Workshop: Agents, MCP & Skills

The main workshop (`agents-mcp-skills.dib`) covers:
- **Intro til Polyglot Notebooks** (5 min)
- **Det agentiske landskab** (15 min) - The 2024-2026 evolution
- **MCP-servere** (50 min) - Model Context Protocol theory + hands-on
- **Skills** (45 min) - Agent skills for GitHub Copilot/Claude Code
- **Byg en Agent** (55 min) - Implementing the agentic loop
- **Integration** (25 min) - Wiring MCP + Skills + Agent together

Domain: Fictional EV charging network (ChargeSmart) in Copenhagen.

## Directory Structure

```
agentic-swe-workshops/
├── CLAUDE.md
├── LICENSE
├── README.md
├── agents-mcp-skills.dib        # Main workshop notebook (3.5 hours)
├── agenda.md                    # Calendar invite agenda (Danish)
├── agent-pattern.png            # Architecture diagram
├── github-copilot-icon.png      # Icon asset
├── images/                      # Mermaid diagrams
│   ├── *.mmd                    # Source files (NEVER delete these!)
│   └── *.svg                    # Rendered (regenerate with mermaid-cli)
└── research/                    # Background research materials
```

## Technology Stack

- **Notebook Format**: Polyglot Notebooks (.dib files)
- **Primary Language**: C#
- **Runtime**: .NET Interactive kernel
- **Editor**: VS Code with Polyglot Notebooks extension
- **Version Control**: Git with main branch `main`

## Polyglot Notebook Format

Each `.dib` file contains cell types:
- `#!meta` - Kernel configuration (JSON)
- `#!markdown` - Documentation cells
- `#!csharp` - C# code cells (executed in shared kernel session)

Variables persist across cells within a session.

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
