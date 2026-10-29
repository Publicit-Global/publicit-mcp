# Publicit MCP

Official remote MCP server for [Publicit](https://www.publicit.com), European advertising infrastructure with its own
real-time bidder hosted in the EU. Connect it to Claude, ChatGPT or any MCP client to plan, prepare, pause and track
ad campaigns in plain language: on connected TV (smart TVs and TV apps), on digital street screens and on mobile, all
through the same bidder.

**Server URL:** `https://www.dashboard.publicit.com/mcp`

| | |
|---|---|
| Transport | Streamable HTTP (stateless) |
| Auth | OAuth 2.1. You sign in with your Publicit account; no API key |
| Tools | 19 (10 read-only) |
| Payments | Never from the chat: you pay or activate in the Publicit dashboard |
| Version | 2.1.0 |

## Quickstart

**Claude (claude.ai, desktop or mobile):** Publicit is in the [Claude connectors directory](https://claude.ai/directory/publicit): open it and choose Connect, then sign in and allow. Or add it by hand: Settings → Connectors → Add custom connector → URL
`https://www.dashboard.publicit.com/mcp`.

**ChatGPT:** Settings → Apps & Connectors → Advanced → turn on developer mode → Create → URL
`https://www.dashboard.publicit.com/mcp`, authentication OAuth → sign in and allow.

**Claude Code:**

```bash
claude mcp add --transport http publicit https://www.dashboard.publicit.com/mcp
```

Then run `/mcp` inside Claude Code to sign in.

**Cursor, VS Code and other clients that read `mcp.json`:**

```json
{
  "mcpServers": {
    "publicit": { "url": "https://www.dashboard.publicit.com/mcp" }
  }
}
```

No account yet? [Create one for free](https://www.dashboard.publicit.com/). Connecting costs nothing; you only pay for
the campaigns you launch.

## Try asking

- "Advertise my café on connected TV in Chamberí, weekday mornings, for one month, with €500."
- "How are my campaigns doing, and is anything waiting for me?"
- "Remove the street screens from the Christmas campaign and raise the budget to €1,200."
- "Use the ad I made in Studio for the Barcelona campaign."
- "How much would it cost to launch it?" (you get the amount and the link to pay)
- "Pause the summer campaign."

## How it works

1. **Create.** The assistant turns your sentence into a draft campaign: objective, dates, budget, audience, locations
   and the spaces Publicit recommends for it (TV channels and apps, street screens, mobile).
2. **Adjust.** Change budget, dates, age, gender, interests or cities, and remove spaces you do not want.
3. **Add the ad.** From a direct https link, or from your Publicit Studio library, and assign it to spaces.
4. **Launch.** The assistant checks everything is ready and tells you the exact amount (media budget + 10% Publicit
   fee + VAT) with a link to your campaign. You pay or activate it there with one click.
5. **Track.** Ask how it is going: delivered impressions, spend, and anything that needs your attention.

## Tools

| Area | Tools |
|---|---|
| Account | `whoami`, `get_team` |
| Campaigns | `list_campaigns`, `get_campaigns_overview`, `get_campaign`, `create_campaign`, `update_campaign`, `add_space_to_campaign`, `remove_space_from_campaign`, `prepare_campaign_launch` (amount + link, no charge), `pause_campaign`, `resume_campaign` |
| Creatives | `list_campaign_media`, `upload_creative_from_url`, `list_studio_creatives`, `add_studio_creative_to_campaign`, `assign_creative` |
| Performance and billing | `get_campaign_performance`, `list_transactions` |

Every tool has a title and explicit `readOnlyHint`, `destructiveHint` and `openWorldHint` annotations.

## Safety

- **The assistant never charges you.** Launching gives you the amount and a link; paying a campaign, activating or
  resuming an always-on campaign, adding cards and topping up your balance happen only in the Publicit dashboard,
  by you. This is also enforced on the server: tokens issued to assistants are refused by every payment endpoint.
- **Your permissions, nothing more.** You sign in on Publicit's own page and see which app you are authorizing and
  where it sends you back. The assistant sees only what your user sees, and you can disconnect it at any time.
- **Same rules as the dashboard.** The MCP calls the same API as the Publicit web app, with the same permission checks.
  It cannot see other companies' campaigns.
- **Stateless.** The server keeps no conversation data.
- Campaigns are served by Publicit's own real-time bidder (OpenRTB, VAST), hosted in the EU.

## FAQ

**What does it cost?** Connecting is free. A campaign costs its media budget plus a 10% Publicit fee and VAT. Minimums:
€500 total budget and €50 per day per campaign. Each publisher sets its own price, visible before you book.

**Can the assistant spend my money by mistake?** No. It cannot pay, top up or activate anything. It only prepares the
campaign and gives you the link.

**Which ad formats work?** Images (JPEG, PNG, WebP, GIF up to 20 MB), video (MP4, WebM, MOV up to 300 MB) and audio.
Each space shows the sizes it accepts; Publicit checks them when you upload.

**Where does my data go?** To Publicit only, under our [privacy policy](https://www.publicit.com/privacy).

## Links

- Product page: https://www.publicit.com/mcp · Spanish: https://www.publicit.com/es/agentes-ia
- Infrastructure: https://www.publicit.com/infrastructure
- Server metadata: https://www.publicit.com/.well-known/mcp.json · MCP Registry: `io.github.Publicit-Global/publicit-mcp`
- Docs: https://docs.publicit.com
- Privacy policy: https://www.publicit.com/privacy · Terms: https://www.publicit.com/terms-of-use
- Company: Publicit Global SLU, Barcelona · IAB Europe TCF vendor ID 1563 ·
  [Wikidata Q141404885](https://www.wikidata.org/wiki/Q141404885)

## Support

Open an issue here or write to info@publicit.es.
