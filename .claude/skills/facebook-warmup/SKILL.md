---
name: facebook-warmup
description: This skill should be used when warming up new Facebook accounts before enabling commenting. It provides a 14-day semi-automated workflow to build account credibility through gradual, human-like activity patterns including likes, group joins, and status updates.
---

# Facebook Account Warm-up Skill

> Build account credibility through natural activity patterns over 14 days

## When to Use This Skill

- To warm up a newly created Facebook account
- To track warm-up progress toward graduation to ACTIVE status
- To execute daily warm-up activities (likes, group joins, status posts)

---

## Required Tool: agent-browser

This skill uses **agent-browser** CLI for Facebook interaction.

### Key Commands
| Command | Purpose |
|---------|---------|
| `agent-browser open <url>` | Navigate to Facebook pages |
| `agent-browser snapshot` | Get page structure (accessibility tree with refs) |
| `agent-browser click <ref>` | Click elements using @ref from snapshot |
| `agent-browser fill <ref> <text>` | Enter text in fields |
| `agent-browser press <key>` | Keyboard input (Enter, Tab, etc.) |

### Important Notes
- Call `snapshot` to understand page structure - returns refs like `@e2` for targeting
- Prefer semantic refs from snapshot over CSS selectors
- Facebook DOM changes frequently - always call snapshot before interacting

---

## Warm-up Goals (14-Day Period)

| Metric | Target | Purpose |
|--------|--------|---------|
| Account age | 14+ days | Minimum age for credibility |
| Groups joined | 5+ | Access to comment targets |
| Total interactions | 50+ | Activity history |
| Status updates | 3-5 | Profile authenticity |
| Friends | 10-20 | Social proof |

---

## Execution Workflow

### Step 1: Load Account Profile

```
1. Load account profile from accounts/profiles/[account-name].md
2. Check current warm-up progress in tracking/warmup/[account-name]/
3. Calculate activities needed for today
4. Verify account has not reached daily activity limits
```

### Step 2: Login Verification

```
1. Open Facebook
   → agent-browser open https://facebook.com

2. Check login status
   → agent-browser snapshot
   → Look for account name in header/navigation

3. If not logged in or wrong account:
   → agent-browser open https://facebook.com/login
   → agent-browser fill '[name="email"]' [email from profile]
   → agent-browser fill '[name="pass"]' [password - prompt user]
   → agent-browser click '[name="login"]'
   → agent-browser snapshot (verify success)
```

### Step 3: Daily Activity Selection

Randomly select 3-5 activities from this list (vary daily):

| Activity | Frequency | How |
|----------|-----------|-----|
| Like posts in feed | Daily (5-10) | Scroll feed, click Like on varied posts |
| React to comments | Daily (3-5) | Open posts, react to existing comments |
| Join cabin crew group | Every 2-3 days | Search and request to join (max 2/day) |
| Post status update | Every 3-4 days | Share something relevant to cabin crew |
| Send friend requests | Every 2-3 days | Request group members (max 3/day) |
| Share a post | Weekly | Share relevant cabin crew content |

### Step 4: Execute Activities

#### 4a. Liking Posts
```
1. Open Facebook feed
   → agent-browser open https://facebook.com

2. Snapshot and identify posts
   → agent-browser snapshot

3. Like varied posts (not all consecutive)
   → agent-browser click [like button ref]

4. Scroll and repeat
   → agent-browser press PageDown
   → agent-browser snapshot
```

#### 4b. Joining Groups
```
1. Search for cabin crew groups
   → agent-browser open https://facebook.com/search/groups?q=cabin%20crew

2. Snapshot results
   → agent-browser snapshot

3. Click on promising group
   → agent-browser click [group link ref]

4. Request to join
   → agent-browser click [join button ref]

5. Answer membership questions if prompted
   → agent-browser snapshot
   → agent-browser fill [question fields]
   → agent-browser click [submit ref]
```

#### 4c. Posting Status Update
```
1. Go to profile or home
   → agent-browser open https://facebook.com

2. Click "What's on your mind?"
   → agent-browser snapshot
   → agent-browser click [composer ref]

3. Type status (cabin crew related, aspirational)
   → agent-browser fill [text area ref] [status text]

4. Post
   → agent-browser click [post button ref]
```

### Step 5: Log Activity

```
1. Update tracking/warmup/[account-name]/YYYY-MM-DD.md with:
   - Activities performed
   - Groups joined (with status: pending/approved)
   - Interactions count
   - Any issues or warnings

2. Update accounts/accounts.md:
   - Increment interaction counts
   - Update groups joined count
   - Check graduation readiness
```

### Step 6: Check Graduation

```
After each session, evaluate graduation checklist:

□ Account age > 14 days?
□ Member of 5+ approved groups?
□ 50+ total interactions?
□ No restrictions/warnings?
□ Profile complete?
□ Posted 2-3 status updates?

If ALL checked:
  → Update account status to ACTIVE in accounts/accounts.md
  → Move account section from "Warming" to "Active"
  → Set daily limit to 20 comments (graduated accounts)
```

---

## Status Update Ideas

Use these templates for organic-looking posts:

1. **Aspirational**: "Another day of interview prep! Emirates assessment day can't come soon enough ✈️"

2. **Learning**: "Just learned that [airline] values [specific trait]. Taking notes for my interview!"

3. **Question**: "Fellow cabin crew aspirants - what's been your biggest challenge in the application process?"

4. **Milestone**: "Finally finished my CV! Now the waiting game begins..."

5. **Gratitude**: "So grateful for this community. The tips here have been invaluable 🙏"

---

## Warm-up Schedule Template

| Day | Focus Activities |
|-----|------------------|
| 1-3 | Profile setup, feed likes (10/day), 1 group join |
| 4-6 | More likes, reactions on comments, 1-2 group joins |
| 7-9 | First status post, friend requests (3), continue engagement |
| 10-12 | Second status, more group activity, reactions |
| 13-14 | Final status, verify all groups approved, graduation check |

---

## Cautions

1. **No commenting** during warm-up - only likes, reactions, shares
2. **Vary activity times** - avoid engaging at the same time daily
3. **Space out group joins** - max 2 per day, skip some days
4. **Authentic persona** - keep all activity consistent with persona backstory
5. **Watch for warnings** - stop immediately if Facebook shows any restriction notice
6. **Avoid rushing** - graduating on day 16 is better than getting banned on day 10
