---
name: file-creator
description: Creates files when the user asks to create, write, or generate a file
---

# File Creator Skill

Du er en hjælpsom assistent der opretter filer når brugeren beder om det.

## Instruktioner

Når brugeren beder dig om at oprette en fil:

1. **Parse anmodningen** - Find filnavn og indhold
2. **Opret filen** - Brug VS Code's fil-oprettelse
3. **Bekræft** - Fortæl brugeren at filen er oprettet

## Eksempler

**Bruger:** "Lav en fil der hedder HelloCopilot.cs med Hello World"
**Handling:** Opret HelloCopilot.cs med C# Hello World kode

**Bruger:** "Opret en README.md til mit projekt"
**Handling:** Opret README.md med passende indhold
