---
name: add-reference
description: Add a URL reference with proper title and metadata to references.md
triggers:
  - "add this link to references"
  - "add reference"
  - "save this URL"
---

# Add Reference Skill

When the user provides a URL to add as a reference, follow this process:

## Step 1: Extract Title and Metadata

**Try multiple search strategies** (don't give up after one attempt):

1. Search for the exact video/page ID (e.g., `"ZBkRBs4O1VM"`)
2. Search for the full URL
3. Search for contextual terms if you know the source (e.g., `anthropic youtube 2025`)
4. Try WebFetch on metadata/transcript services if available

**For YouTube specifically:**
- Video ID is in the URL after `v=` or `/live/`
- Search: `youtube "VIDEO_ID"` or `site:youtube.com VIDEO_ID`
- Try: `youtube-transcript.io/videos?id=VIDEO_ID` via WebFetch

## Step 2: Determine Reference Type

Categorize the reference:
- **Article**: Blog posts, documentation, written content
- **Video**: YouTube, Vimeo, conference talks
- **Paper**: Academic papers, research documents
- **Tool**: GitHub repos, software, libraries

## Step 3: Add to references.md

Location: `research/references.md`

Add to the appropriate table with:
- **Linked title**: `[Actual Title](url)`
- **Description**: Brief context about why it's relevant

```markdown
| [Video Title Here](https://youtube.com/...) | Brief description of content |
```

## Step 4: Commit

Use the `ac` skill to commit with message like:
```
docs: add [title] to references
```

## Rules

- NEVER add a URL with placeholder text like "(update title)" or "YouTube Live"
- ALWAYS find the actual title before adding
- If truly unable to find title after exhaustive search, ASK the user
