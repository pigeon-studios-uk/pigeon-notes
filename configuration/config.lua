Config = {}

-- Language file from locales/ to use, such as 'en'.
Config.Locale = 'en'

---------------------------------------------------------------------------
-- Writing

-- The command that opens the notepad. Other resources can open it too, such as when a notepad item is
-- used from an inventory (see the README's Exports).
Config.Command = 'note'

-- A key for the command, which players can change in GTA's Settings -> Key Bindings -> FiveM.
-- '' leaves it unbound until a player chooses one. Codes: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.Key = ''

-- What players can write on. model is the prop that's placed; maxLength is in characters; colour is the
-- page colour when it's read.
Config.Styles = {
    paper = { label = 'Paper', model = 'prop_amanda_note_01', maxLength = 600, colour = '#f6f1e4' },
    postit = { label = 'Post-it', model = 'hei_prop_hei_post_note_01', maxLength = 140, colour = '#fbe86b' },
}

-- The style the notepad opens on.
Config.DefaultStyle = 'paper'

-- Let players sign their note. Signed notes show their character's name with Qbox, QBCore or ESX, or
-- their FiveM name.
Config.AllowSigning = true

---------------------------------------------------------------------------
-- Placing

-- How far away, in metres, a player can place a note: where they're looking, up to this far.
Config.PlaceDistance = 3.0

-- Seconds a player has to wait between placing notes.
Config.Cooldown = 10

-- Most notes one player can have placed at once, and on the whole server. 0 for no limit.
Config.MaxPerPlayer = 5
Config.MaxTotal = 300

-- Days before a note disappears on its own. 0 keeps notes until someone takes them down.
Config.ExpiryDays = 7

---------------------------------------------------------------------------
-- Reading and taking down

-- How close, in metres, a player has to be to read a note.
Config.ReadDistance = 1.8

-- How far away, in metres, notes are shown in the world.
Config.DrawDistance = 40.0

-- Who can take a note down:
--   'author'  the player who wrote it, and staff
--   'anyone'  anyone who reads it
--   'staff'   staff only
Config.WhoCanRemove = 'author'

-- Staff can take any note down, with this ACE permission, granted in server.cfg:
--     add_ace group.admin pigeon-notes.staff allow
Config.StaffPermission = 'pigeon-notes.staff'

---------------------------------------------------------------------------
-- Logging

-- New and removed notes are printed in the server console. To send them to Discord as well, for
-- moderation, set the webhook in server.cfg, never here: this file is sent to every player's game.
--     set pigeon_notes_webhook "https://discord.com/api/webhooks/..."
Config.ConsoleLog = true

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
