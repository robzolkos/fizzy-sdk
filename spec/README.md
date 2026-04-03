# Spec Layout

This directory contains the canonical Fizzy spec used for SDK generation.

## Files

- `fizzy.smithy` — canonical model (types + operations)
- `fizzy-traits.smithy` — custom Fizzy traits used by the spec
- `api-provenance.json` — upstream revision tracking for the Fizzy app and API docs

## Grounding

The SDK generation pipeline starts from Smithy, but the Smithy spec is maintained against upstream Fizzy sources:

- API reference docs: `basecamp/fizzy` → `docs/api/README.md`
- API section docs: `basecamp/fizzy` → `docs/api/sections/*.md`
- Routes: `basecamp/fizzy` → `config/routes.rb`
- Controllers: `basecamp/fizzy` → `app/controllers/`
- Views / JSON rendering: `basecamp/fizzy` → `app/views/`
- Relevant models / serializers: `basecamp/fizzy` → `app/models/`

## Conventions

- Keep the Smithy model as the machine-readable source of truth for SDK generation.
- Treat OpenAPI as derived output only.
- When upstream docs and app behavior disagree, verify against Rails routes/controllers/views and update Smithy accordingly.
- Prefer additive, shape-accurate spec updates over speculative abstraction.
