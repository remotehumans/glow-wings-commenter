# Glow Wings Commenter

> Social media auto-commenter for Glowings cabin crew coaching platform promotion

---

## Project Overview

This repo contains Claude Code skills for automated, authentic community engagement on:
- **Facebook** - Cabin crew groups and airline career pages
- **Reddit** - (inherited from upstream, not primary focus)

The goal is to promote [Glowings](https://glowings.cc) through genuine, helpful comments in cabin crew communities - not spam.

---

## Browser Automation

**CRITICAL**: Use `agent-browser` CLI for all browser automation. NOT Playwright MCP or chrome-devtools.

```bash
# Navigation
agent-browser open <url>
agent-browser snapshot      # Get accessibility tree with refs

# Interaction
agent-browser click <ref>   # Use @refs from snapshot
agent-browser fill <ref> <text>
agent-browser press <key>

# Information
agent-browser get text <ref>
agent-browser get url
```

---

## Directory Structure

```
glow-wings-commenter/
├── .claude/skills/
│   ├── facebook-commenter/     # Main Facebook commenting skill
│   │   ├── SKILL.md            # Single comment workflow
│   │   ├── BATCH.md            # Batch processing
│   │   └── resources/
│   │       ├── personalization_facebook.md
│   │       ├── targets.md      # Groups & pages
│   │       └── product.md      # Glowings info
│   ├── facebook-warmup/        # New account warm-up
│   │   └── SKILL.md
│   └── reddit-commenter/       # Reddit (from upstream)
│
├── accounts/
│   ├── accounts.md             # Account registry
│   └── profiles/               # Per-account configs
│
├── tracking/
│   ├── facebook/               # Per-account daily logs
│   └── warmup/                 # Warm-up progress logs
│
└── leads/
    ├── facebook.md             # Facebook leads
    └── reddit.md               # Reddit leads
```

---

## Multi-Account Strategy

1. **Primary account** - Your existing account, ready immediately
2. **Warming accounts** - New accounts in 14-day warm-up period

See `accounts/accounts.md` for current account status and selection logic.

---

## Quick Start

### Single Comment
```
/facebook-commenter
```

### Batch Mode
```
/facebook-commenter batch
```

### Warm-up New Account
```
/facebook-warmup [account-name]
```

---

## Key Principles

1. **Helpful first** - Every comment should genuinely help the person
2. **Natural mentions** - Most comments (85%+) should NOT mention Glowings
3. **Authentic voice** - Sound like a real person, not a brand
4. **Variety** - Mix comment lengths, structures, and styles
5. **Rate respect** - Follow delays, watch for warnings
6. **Multi-account** - Distribute activity across accounts

---

## Glowings Mention Guidelines

**When to mention** (10-15% of comments):
- OP explicitly asks for prep resources
- Natural "what helped me" context
- Specific feature matches their need

**When NOT to mention** (85-90%):
- Celebration posts
- Venting/frustration (empathy only)
- Simple factual questions
- Would feel forced

---

## Safety Notes

- Start new accounts with 14-day warm-up
- Never exceed daily limits per account
- Switch accounts if any warning appears
- Don't comment from warming accounts
- Keep activity looking human-like
