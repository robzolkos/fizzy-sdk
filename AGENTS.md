# Fizzy SDK -- Agent Instructions

## Hard Rules

1. **Never hand-write API methods.** All operations are generated from the Smithy spec.
2. **Never construct URL paths manually.** Use the generated route table.
3. **Every new operation needs tests.** Unit tests per language + conformance tests.
4. **Run `make check` before committing.** All checks must pass.

## Pipeline

```
Smithy spec -> OpenAPI -> Behavior Model -> Per-language generators -> SDK code
```

## Anti-Patterns

- Editing `openapi.json` directly (it is generated from Smithy)
- Adding API methods without updating the Smithy spec
- Skipping conformance tests for behavioral changes
- Using `fmt.Sprintf` or template literals for API paths

## Development Workflow

1. Review upstream Fizzy API sources:
   - `~/code/basecamp/fizzy/docs/api/README.md`
   - `~/code/basecamp/fizzy/docs/api/sections/*.md`
   - `~/code/basecamp/fizzy/config/routes.rb`
   - `~/code/basecamp/fizzy/app/controllers/`
   - `~/code/basecamp/fizzy/app/views/`
2. Edit the Smithy spec in `spec/`
3. Run `make smithy-build` to regenerate OpenAPI
4. Run per-language generators: `make {lang}-generate-services`
5. Add/update tests
6. Run `make check`
7. Commit

## Upstream Reference Sources

When syncing the SDK spec to upstream Fizzy changes, treat these as the primary references:

- **API docs** — `~/code/basecamp/fizzy/docs/api/README.md`
- **API section docs** — `~/code/basecamp/fizzy/docs/api/sections/*.md`
- **Routes** — `~/code/basecamp/fizzy/config/routes.rb`
- **Controllers** — `~/code/basecamp/fizzy/app/controllers/`
- **Views / JSON rendering** — `~/code/basecamp/fizzy/app/views/`
- **Relevant models** — `~/code/basecamp/fizzy/app/models/`

The SDK generation pipeline still starts from Smithy, but Smithy should be kept aligned with these upstream sources.

## Auth Model

Fizzy uses **two auth strategies** (no OAuth):

- **BearerAuth** — `Authorization: Bearer <token>` for CLI/API access tokens
- **CookieAuth** — `Cookie: session_token=<value>` for session-based auth (mobile/web)
- **MagicLinkFlow** — orchestrates passwordless login: `CreateSession` → `RedeemMagicLink`

## Service Inventory

70 operations across 15 services:

| Service | Operations |
|---------|-----------|
| Identity | GetMyIdentity |
| Boards | ListBoards, CreateBoard, GetBoard, UpdateBoard, DeleteBoard |
| Columns | ListColumns, CreateColumn, GetColumn, UpdateColumn |
| Cards | ListCards, CreateCard, GetCard, UpdateCard, DeleteCard, CloseCard, ReopenCard, PostponeCard, TriageCard, UnTriageCard, GoldCard, UngoldCard, AssignCard, SelfAssignCard, TagCard, WatchCard, UnwatchCard, PinCard, UnpinCard, MoveCard, DeleteCardImage |
| Comments | ListComments, CreateComment, GetComment, UpdateComment, DeleteComment |
| Steps | CreateStep, GetStep, UpdateStep, DeleteStep |
| Reactions | ListCardReactions, CreateCardReaction, DeleteCardReaction, ListCommentReactions, CreateCommentReaction, DeleteCommentReaction |
| Notifications | ListNotifications, ReadNotification, UnreadNotification, BulkReadNotifications, GetNotificationTray |
| Tags | ListTags |
| Users | ListUsers, GetUser, UpdateUser, DeactivateUser |
| Pins | ListPins |
| Uploads | CreateDirectUpload |
| Webhooks | ListWebhooks, CreateWebhook, GetWebhook, UpdateWebhook, DeleteWebhook, ActivateWebhook |
| Sessions | CreateSession, RedeemMagicLink, DestroySession, CompleteSignup |
| Devices | RegisterDevice, UnregisterDevice |
