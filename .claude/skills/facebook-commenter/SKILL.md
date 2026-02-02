---
name: facebook-commenter
description: This skill should be used when posting comments in Facebook cabin crew communities to promote Glowings. It provides multi-account management, authentic engagement workflows, and personalization guidelines for genuine community participation.
---

# Facebook Commenter Skill

> Authentic community engagement in cabin crew Facebook groups and pages

## When to Use This Skill

- To post helpful comments in cabin crew Facebook groups
- To run batch commenting sessions across multiple groups
- To manage multi-account activity distribution
- For batch mode, see `BATCH.md` in this skill directory

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
| `agent-browser get text <ref>` | Extract text from elements |

### Important Notes
- Always call `snapshot` before interacting - Facebook DOM changes frequently
- Use refs from snapshot (like `@e42`) rather than CSS selectors
- Minimize token usage by passing only essential info to each command

---

## Execution Workflow

### Step 0: Account Selection

```
1. Read accounts/accounts.md
2. Find ACTIVE accounts with remaining daily quota
3. Select account with:
   - Lowest activity today (distribute load)
   - Membership in target group
   - No recent rate-limiting
4. Load account profile from accounts/profiles/[name].md
5. Note account's daily limit and current count
```

### Step 1: Session Verification

```
1. Open Facebook
   → agent-browser open https://facebook.com

2. Verify logged into correct account
   → agent-browser snapshot
   → Check for account name in header

3. If wrong account or not logged in:
   → Log out if needed: click account menu → Log Out
   → agent-browser open https://facebook.com/login
   → agent-browser fill '[name="email"]' [email]
   → agent-browser fill '[name="pass"]' [password - prompt user]
   → agent-browser click '[name="login"]'
   → agent-browser snapshot (verify)
```

### Step 2: Select Target Group/Page

```
1. Check today's tracking file: tracking/facebook/[account]/YYYY-MM-DD.md
   → Create from template if doesn't exist

2. Review activity status:
   - Comments per group today
   - Last comment time
   - Groups under daily limit

3. Select target from resources/targets.md:
   - Prioritize groups with 0 activity today
   - Then groups with oldest last activity
   - Ensure account is member of selected group

4. Load group-specific rules from targets.md:
   - Posting rules
   - Tone expectations
   - Topics to engage with
```

### Step 3: Navigate and Find Post

```
1. Navigate to group
   → agent-browser open [group URL from targets.md]

2. Snapshot the page
   → agent-browser snapshot

3. Scan recent posts for engagement opportunities
   Criteria for good posts:
   ✓ Questions about interview prep, CV help, airline requirements
   ✓ Struggles/frustrations with application process
   ✓ Requests for advice or experiences
   ✓ Moderate engagement (not 0, not 500+ comments)

   Skip:
   ✗ Posts you've already commented on today (check tracking)
   ✗ Pure celebration posts ("I got the job!")
   ✗ Off-topic posts
   ✗ Posts older than 48 hours

4. Select post and note its URL/identifier
```

### Step 4: Analyze Post Context

```
⚠️ CRITICAL: Never comment without full context analysis

1. Click into full post
   → agent-browser click [post ref]
   → agent-browser snapshot

2. Read post content completely:
   - Identify what OP is actually asking/sharing
   - Determine their situation (applying, preparing, rejected, etc.)
   - Note which airline(s) they are targeting
   - Understand what specific help they need

3. Analyze existing comments:
   - Review what advice has already been given
   - Assess the tone of the discussion
   - Identify gaps to fill with new value

4. Decide if worth commenting:
   - Evaluate whether genuine value can be added
   - Determine if Glowings mention fits naturally (often NO)
   - Assess expertise match with their need

5. If site/link verification needed:
   - Visit any shared CV/portfolio link
   - Comment only on what was actually observed
```

### Step 5: Draft Comment

```
1. Based on Step 4 analysis, draft a comment that:
   - Directly addresses OP's actual question/need
   - Provides specific, actionable advice
   - Matches the group's tone (warm, supportive for cabin crew)
   - Sounds like a real person, not a brand

2. Comment structure options (vary these):
   - Direct answer only (short)
   - Personal experience + tip
   - Question to understand better + initial thought
   - Empathy + specific advice

3. Glowings mention decision:
   - Mention ONLY if OP explicitly asks for resources/tools
   - Mention ONLY if it naturally fits ("I used X when prepping...")
   - NEVER force it - most comments should NOT mention Glowings
   - Refer to resources/product.md for natural mention templates
```

### Step 6: Personalization Review

```
1. Load resources/personalization_facebook.md
   → Review all checklist items against the draft

2. Key checks:
   □ Sounds human (not AI-generated)
   □ Length appropriate for this post type
   □ No cliché phrases ("Great question!", "Hope this helps!")
   □ Matches Facebook tone (warmer than Reddit)
   □ No obvious self-promotion

3. Review recent comments in tracking:
   - Verify structure varies from last 5 comments
   - Verify length varies
   - Confirm not ending every comment with a question

4. PASS → Proceed to Step 7 / FAIL → Revise and re-check
```

### Step 7: Post Comment

```
1. Click comment box
   → agent-browser snapshot (find comment input)
   → agent-browser click [comment box ref]

2. Type comment
   → agent-browser fill [input ref] [comment text]

3. Post comment
   → agent-browser click [post/send button ref]
   OR
   → agent-browser press Enter

4. Verify posted
   → agent-browser snapshot
   → Confirm comment appears in thread

5. Note comment URL/timestamp for tracking
```

### Step 8: Lead Assessment (Optional)

```
⚠️ Based on Step 4 analysis, determine if OP is potential lead

Lead criteria (see leads/facebook.md):
- Actively preparing for specific airline interview
- Timeline: interviewing within 3 months
- Expressing frustration with prep process
- Asking about specific assessment day components

If lead identified:
→ Update leads/facebook.md with details
→ Note in tracking file
```

### Step 9: Update Tracking

```
Update tracking/facebook/[account]/YYYY-MM-DD.md:

1. Activity status table:
   - Increment comment count for group
   - Update last comment time

2. Add to activity log:
   ### [HH:MM] [Group Name]
   - **Post**: [Title/summary](URL)
   - **OP Need**: One-line summary
   - **Comment**:
   ```
   [Full comment text]
   ```
   - **Glowings mentioned**: Yes/No
   - **Lead**: Yes/No

3. Update accounts/accounts.md if needed:
   - Increment daily activity count
   - Note any warnings/issues
```

---

## File Reference Rules

| File | When to Reference |
|------|-------------------|
| `accounts/accounts.md` | Step 0 (account selection) |
| `accounts/profiles/[name].md` | Step 0-1 (login, limits) |
| `resources/targets.md` | Step 2 (group selection) |
| `resources/personalization_facebook.md` | Step 6 (review) |
| `resources/product.md` | Step 5 (if considering mention) |
| `leads/facebook.md` | Step 8 (lead criteria) |

→ Reference only at relevant step to save tokens

---

## Cautions

1. **Login verification**: Always confirm correct account before commenting
2. **Rate limiting**: Respect delays, watch for Facebook warnings
3. **Group rules**: Each group has specific rules - follow them
4. **No spam**: Never copy-paste same comment; each must be unique
5. **Review required**: Never post without personalization check
6. **Context first**: NEVER comment without reading full post + existing comments
7. **Natural promotion**: Most comments should NOT mention Glowings
8. **Account rotation**: Distribute activity across accounts
9. **Token efficiency**: Pass minimal info to agent-browser commands
