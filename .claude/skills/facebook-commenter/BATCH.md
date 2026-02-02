# Facebook Commenter - Batch Mode

> Multi-account batch processing for daily quota completion
> See SKILL.md for single comment workflow

---

## Batch Execution Triggers

Start batch mode with these commands:
- "Fill today's Facebook quota"
- "Run Facebook batch"
- "Comment on Facebook groups"

---

## Configuration

### Per-Account Limits
| Account Type | Daily Comments | Per-Group Limit |
|--------------|----------------|-----------------|
| ACTIVE (established) | 30 | 5 |
| ACTIVE (graduated) | 20 | 4 |
| WARMING | 0 (no commenting) | 0 |

### Timing
| Situation | Delay |
|-----------|-------|
| Between comments (same group) | 30-90 seconds (randomized) |
| Between groups | 5-15 minutes (randomized) |
| Between account switches | 30-60 minutes |

### Daily Targets
- **Single active account**: 20-30 comments
- **Two active accounts**: 40-50 comments
- **Three active accounts**: 60-75 comments

---

## Pre-Start Check

```
1. Check accounts/accounts.md for ACTIVE accounts
2. For each active account, check tracking/facebook/[account]/today.md
3. Calculate remaining quota per account:
   Remaining = Daily limit - Today's comments
4. Calculate total remaining across all accounts
5. Identify which groups each account can access
```

---

## Batch Workflow

```
[Start]
    ↓
[1] Load all ACTIVE accounts and their quotas
    ↓
[2] Select account with most remaining quota
    ↓
[3] Verify login to selected account
    ↓
[4] Select group under quota (that account is member of)
    ↓
[5] Comment loop for that group:
    ↓
    [5-1] Execute SKILL.md Steps 3-9 (single comment)
    ↓
    [5-2] Update tracking
    ↓
    [5-3] Random delay (30-90s)
    ↓
    [5-4] Check group quota:
          - Under limit & posts available → back to [5-1]
          - At limit or no posts → to [6]
    ↓
[6] Check if should switch accounts:
    - Current account done 10-15 comments this session?
    - Other accounts have significantly more quota?
    → YES: Go to [7]
    → NO: Wait 5-15 min, go to [4] (next group)
    ↓
[7] Switch accounts:
    - Log out current account
    - Wait 30-60 minutes
    - Select next account with quota
    - Go to [3]
    ↓
[8] Check termination conditions
    → Met: [End]
    → Not met: Return to [4]
```

---

## Account Rotation Strategy

### Why Rotate
- Distributes activity risk across accounts
- If one gets restricted, others continue
- Looks more natural than one account doing everything

### Rotation Triggers
1. **Quota-based**: Current account hits daily limit
2. **Session-based**: After 10-15 comments, consider switching
3. **Time-based**: Been on same account 1+ hour
4. **Warning-based**: Any rate limit warning → immediate switch

### Rotation Process
```
1. Log current progress in tracking
2. Log out of Facebook (important for session isolation)
3. Wait 30-60 minutes (mandatory cooling period)
4. Log into next account
5. Verify correct account before resuming
```

---

## Group Selection Priority

| Priority | Criteria | Reason |
|----------|----------|--------|
| 1 | Groups with 0 activity today | Ensure variety |
| 2 | Groups with oldest last activity | Distributed presence |
| 3 | Groups with high engagement posts | Better ROI |
| 4 | Groups under per-group limit | Complete quotas |

---

## Progress Reporting

### During Batch
```
---
[Progress] 15/60 completed (across 2 accounts)

Account: primary (10/30)
✓ Emirates Cabin Crew Aspirants: 5/5
→ Qatar Airways Dreamers: 3/5 (current)
- Etihad Careers Community: 0/5
- Cabin Crew Life: 0/5

Account: sarah-backup (5/20)
✓ Emirates Cabin Crew Aspirants: 5/4
- Qatar Airways Dreamers: 0/4

Next: Complete Qatar group, then switch to sarah-backup
---
```

### Completion Report
```
---
## Batch Completion Report

**Total Comments**: 45/60
**Duration**: 3 hours 20 minutes
**Accounts Used**: 2

### Results by Account

#### primary (25/30)
| Group | Comments | Notes |
|-------|----------|-------|
| Emirates Cabin Crew Aspirants | 5/5 | ✓ |
| Qatar Airways Dreamers | 5/5 | ✓ |
| Etihad Careers Community | 5/5 | ✓ |
| Cabin Crew Life | 5/5 | ✓ |
| Flight Attendant Network | 5/5 | ✓ |

#### sarah-backup (20/20)
| Group | Comments | Notes |
|-------|----------|-------|
| Emirates Cabin Crew Aspirants | 4/4 | ✓ |
| Qatar Airways Dreamers | 4/4 | ✓ |
| Etihad Careers Community | 4/4 | ✓ |
| Cabin Crew Life | 4/4 | ✓ |
| Flight Attendant Network | 4/4 | ✓ |

### Leads Discovered
- 3 high relevance (updated in leads/facebook.md)

### Issues
- primary: Slight slowdown warning at comment 22 (backed off)
- sarah-backup: Clean run

### Glowings Mentions
- 4 natural mentions (8.9% of comments)
---
```

---

## Termination Conditions

Batch stops when ANY of these occur:

1. **Quota complete**: All accounts at daily limit
2. **No posts**: No suitable posts in accessible groups
3. **User interrupt**: User requests stop
4. **Rate limit**: Persistent warning on current account (switch or stop)
5. **Error threshold**: 3+ consecutive failures
6. **Time limit**: 4+ hours elapsed (fatigue risk)

---

## Error Handling

| Error | Response |
|-------|----------|
| Page load failure | Wait 30s, retry (max 3) |
| Comment post failure | Skip post, try next |
| Login session expired | Re-login, resume |
| Rate limit warning | Switch account or pause 30 min |
| Account restricted | Mark account, switch to next |
| All accounts restricted | Stop batch, alert user |

---

## Skip Conditions

Skip a group when:
- No posts meeting criteria after reviewing 5-7 posts
- All recent posts already commented on today
- Group has posting restrictions active

When skipping:
```
Emirates Cabin Crew Aspirants skipped - No suitable posts
→ Moving to Qatar Airways Dreamers
```

---

## Natural Behavior Patterns

To avoid detection, batch mode should:

1. **Vary timing**: Random delays, not fixed intervals
2. **Vary length**: Mix short and long comments
3. **Don't be perfect**: Occasional typo left unfixed is OK
4. **React without commenting**: Sometimes just like a post
5. **Read without engaging**: Scroll past some posts
6. **Take breaks**: 5-10 min breaks every hour
7. **Vary Glowings mentions**: Most comments (85%+) shouldn't mention it
