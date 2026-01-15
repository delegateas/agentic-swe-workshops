# Create Mermaid Diagram

Creates a Mermaid diagram, exports it to SVG, and inserts it into a Polyglot Notebook.

## Steps

1. **Create the .mmd file** in `images/` folder
   - Name it to match the diagram's purpose (e.g., `tool-calling-flow.mmd`)
   - Use kebab-case for filenames

2. **Export to SVG** using mermaid-cli:
   ```bash
   npx -y @mermaid-js/mermaid-cli mmdc -i images/<name>.mmd -o images/<name>.svg
   ```

3. **Insert into notebook** using this img tag format:
   ```html
   <img src="images/<name>.svg" alt="<Alt Text>" width="600" style="max-width: 100%;">
   ```
   - **Width**: Always use `width="600"`
   - **Alt text**: Derive from filename (e.g., `tool-calling-flow.svg` → `"Tool Calling Flow"`)
   - Convert kebab-case to Title Case for alt text

## Important

- **Never delete .mmd source files** — they are the source of truth
- Always create the .mmd first, then export to SVG
- If updating an existing diagram, edit the .mmd and re-export

## Example

Creating a diagram for "agent loop":

```bash
# 1. Write the .mmd file to images/agent-loop.mmd
# 2. Export to SVG
npx -y @mermaid-js/mermaid-cli mmdc -i images/agent-loop.mmd -o images/agent-loop.svg
```

```html
<!-- 3. Insert in notebook -->
<img src="images/agent-loop.svg" alt="Agent Loop" width="600" style="max-width: 100%;">
```
