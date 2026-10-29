# Publicit for ChatGPT (plugin package)

Package uploaded at platform.openai.com/plugins → *Upload new or existing plugin*. It only wraps the remote
MCP server (`https://www.dashboard.publicit.com/mcp`, OAuth with dynamic client registration): no skills, no
hooks, no secrets.

Build the ZIP from this folder (files at the root of the archive, not inside a folder):

```bash
cd chatgpt-plugin && zip -r -X ../publicit-chatgpt-plugin.zip plugin.json mcp.json assets
```
