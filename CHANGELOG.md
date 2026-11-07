# Changelog

All notable changes to Pigeon Notes are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

### Added

- 22 more languages, so it now comes in 23: Czech, Danish, German, Spanish, Estonian, Finnish, French, Croatian, Hungarian, Indonesian, Italian, Dutch, Norwegian, Polish, Portuguese, Brazilian Portuguese, Romanian, Slovenian, Swedish, Turkish, and Simplified and Traditional Chinese.
- `Config.Locale = 'auto'`, the new default: it follows ox_lib's language (`setr ox:locale "de"` in `server.cfg`) and is English when that isn't set. A config that already says `'en'` stays in English.

## [1.0.0] - 2026-11-03

First release.

### Highlights

- Write a note and stick it on a wall, table or floor
- Notes stay through restarts, with no database
- Paper or post-it, signed or not
- Limits, expiry and taking notes down
- Discord log for moderation

### Added

- Writing a note on paper or a post-it with `/note`, an optional key, or from another resource such as an inventory item, signed with the character's name or unsigned.
- Placing it where the player looks, on walls, tables and floors, with a see-through preview, turning it on floors.
- Reading notes by walking up to them and pressing E.
- Notes kept in the server's own storage, so they survive restarts without a database, and shown only in the routing bucket they were placed in.
- Every note checked on the server: length, style, distance from the player, a cooldown, a limit per player and in total.
- Notes that expire after a number of days.
- Taking notes down by their author and staff, staff only or anyone.
- New and removed notes in the server console, and in Discord with a webhook set in `server.cfg`.
- `OpenNotepad` client export, and `GetNotes` and `RemoveNote` server exports.
- Every message in `locales/`.
- Update checker from the Pigeon Studios version registry.

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-notes/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/pigeon-studios-uk/pigeon-notes/releases/tag/v1.0.0
