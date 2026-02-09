# Social Media Account Registry

> Multi-platform account management for Glowings promotion

---

## Quick Status

| Platform | Account | Status | Progress |
|----------|---------|--------|----------|
| Facebook | Amy Chen | WARMING | Day 2/14, 7/50 interactions |
| Instagram | amyy.chennnnn | ACTIVE | Logged in, ready |
| Reddit | readyfortakeoff7209 | NEW | Karma building needed |
| TikTok | Amy Chen | BLOCKED | Rate limited, wait 24h+ |

---

## Facebook - Amy Chen

**Bitwarden**: `Facebook - Amy Chen`

| Field | Value |
|-------|-------|
| Status | WARMING (Day 2/14) |
| Email | rdavids552@gmail.com |
| Persona | Amy Chen (aspiring cabin crew) |
| Created | 2026-02-02 |
| Ready date | ~2026-02-16 |
| Browser session | `--session facebook` |

### Warmup Progress
- **Groups**: 1 approved + 2 pending / 5 required
- **Interactions**: 7/50 required
- **Status updates**: 0/3 required
- **Last activity**: 2026-02-04 (7 likes, 2 group joins)

### Graduation Checklist
- [ ] Account age > 14 days
- [ ] Member of 5+ groups (approved)
- [ ] 50+ total interactions
- [ ] No restrictions/warnings
- [ ] Profile complete
- [ ] 2-3 status updates posted

---

## Instagram - amyy.chennnnn

**Bitwarden**: `Instagram - Amy Chen`

| Field | Value |
|-------|-------|
| Status | ACTIVE |
| Username | amyy.chennnnn |
| Persona | Amy Chen |
| 2FA | Yes (TOTP in Bitwarden) |
| Browser session | `--session instagram` |

### Notes
- Logged in successfully 2026-02-04
- Ready for commenting
- Follow cabin crew hashtags and influencers

---

## Reddit - readyfortakeoff7209

**Bitwarden**: `Reddit - Amy Chen`

| Field | Value |
|-------|-------|
| Status | NEW (karma building) |
| Username | readyfortakeoff7209 |
| Persona | Glowings team member (transparent) |
| 2FA | No |
| Browser session | `--session reddit` |
| Current karma | 1 |
| Account age | 1 week (created ~2026-02-02) |

### Warmup Strategy
- **Phase 1 (NOW)**: Build karma in easy subs (r/AskReddit, r/travel, r/aviation, r/singapore)
- **Phase 2 (50+ karma)**: Enter r/cabincrewcareers, r/flightattendants with pure advice
- **Phase 3 (100+ karma)**: Mix in tool-output comments (CV analyzer results, etc.)
- **Approach**: Transparent team member, NOT fake aspirant persona
- **Glowings mentions**: 20-30% of cabin crew comments (always after value)

### Notes
- Logged in successfully 2026-02-04
- Cannot comment in r/cabincrewcareers yet (karma too low)
- Profile bio: "Aspiring cabin crew | Sharing my journey to the skies | Singapore"
- Profile bio needs update to reflect team member role once karma is established
- Reddit anti-bot detection active - use carefully

---

## TikTok - Amy Chen

**Bitwarden**: `TikTok - Amy Chen`

| Field | Value |
|-------|-------|
| Status | BLOCKED |
| Email | rdavids552@gmail.com |
| Persona | Amy Chen |
| 2FA | No |
| Browser session | `--session tiktok` |

### Issue
- Rate limited on 2026-02-04: "Maximum number of attempts reached"
- Wait 24-48 hours before retry
- Consider using Google OAuth login instead

---

## Daily Limits

| Platform | Comments/Day | Likes/Day | Notes |
|----------|--------------|-----------|-------|
| Facebook (warming) | 0 | 20 | No comments until graduated |
| Facebook (active) | 20-30 | 50 | After 14-day warmup |
| Instagram | 15-20 | 30 | Vary timing |
| Reddit | 5-10 | 20 | Quality > quantity |
| TikTok | 10-15 | 30 | Short, punchy comments |

---

## Browser Sessions

Always use named sessions to maintain login state:

```bash
agent-browser open <url> --session facebook --headed
agent-browser open <url> --session instagram --headed
agent-browser open <url> --session reddit --headed
agent-browser open <url> --session tiktok --headed
```

---

## Statistics

| Status | Count |
|--------|-------|
| ACTIVE | 1 (Instagram) |
| WARMING | 1 (Facebook) |
| NEW | 1 (Reddit) |
| BLOCKED | 1 (TikTok) |
| **Total** | **4** |
