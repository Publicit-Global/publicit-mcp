# Publicit MCP

Official remote MCP server for [Publicit](https://www.publicit.com), European advertising infrastructure with its own real-time bidder hosted in the EU. Connect it to Claude, ChatGPT or any MCP client and plan, launch, pause and track ad campaigns on connected TV (smart TVs and TV apps) in plain language, and on digital street screens and mobile through the same bidder.

**Server URL:** `https://www.dashboard.publicit.com/mcp`
Transport: streamable HTTP · Auth: OAuth (sign in with your Publicit account, no API key) · Version 2.0.0 · 19 tools

## Quickstart

**Claude (claude.ai or desktop):** Settings → Connectors → Add custom connector → name `Publicit`, URL `https://www.dashboard.publicit.com/mcp` → sign in and allow.

**ChatGPT:** add a custom connector with the same URL.

**Claude Code:**
```bash
claude mcp add --transport http publicit https://www.dashboard.publicit.com/mcp
```

**Cursor, VS Code and other clients that read `mcp.json`:**
```json
{
  "mcpServers": {
    "publicit": { "url": "https://www.dashboard.publicit.com/mcp" }
  }
}
```

No account yet? [Create one for free](https://www.dashboard.publicit.com/). Connecting costs nothing; you pay only for the campaigns you launch.

## Try asking

- "Advertise my café on connected TV in Chamberí, weekday mornings, one month, €500."
- "How many times has my Barcelona campaign been seen, and how much have I spent?"
- "Pause the Christmas campaign." / "Resume it."
- "Use the ad I made in Studio."

## Tools

| Area | Tools |
|---|---|
| Account | `whoami`, `get_team` |
| Campaigns | `list_campaigns`, `get_campaigns_overview`, `get_campaign`, `create_campaign`, `update_campaign`, `add_space_to_campaign`, `remove_space_from_campaign`, `launch_campaign`, `pause_campaign`, `resume_campaign` |
| Creatives | `list_campaign_media`, `upload_creative_from_url`, `list_studio_creatives`, `add_studio_creative_to_campaign`, `assign_creative` |
| Performance and billing | `get_campaign_performance`, `list_transactions` |

## Safety

- **Nothing is charged without your yes.** Before launching or resuming, the assistant shows the exact amount (media + 10% Publicit fee + VAT) and waits for your confirmation.
- **No cards from the chat.** Cards and balance can only be added in the Publicit dashboard.
- **Your permissions, nothing more.** OAuth sign-in on Publicit's own page; the assistant sees what your user sees and you can disconnect it at any time.
- The MCP calls the same API as the Publicit dashboard. Campaigns are served by Publicit's own real-time bidder (OpenRTB, VAST), hosted in the EU.

## Minimums

€500 total budget and €50 per day per campaign. Each publisher sets its own price, visible before you book.

## Links

- Product page: https://www.publicit.com/mcp · Spanish: https://www.publicit.com/es/agentes-ia
- Infrastructure: https://www.publicit.com/infrastructure
- Server metadata: https://www.publicit.com/.well-known/mcp.json
- Docs: https://docs.publicit.com
- Company: Publicit Global S.L., Barcelona · IAB Europe TCF vendor ID 1563 · [Wikidata Q141404885](https://www.wikidata.org/wiki/Q141404885)

## Support

Open an issue here or write to info@publicit.es.
