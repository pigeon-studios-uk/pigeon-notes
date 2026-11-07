--[[
    Pigeon Notes: French (Français).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'fr'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.fr = {
    title = 'Notes',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Écrire une note',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Écrire une note',
    write_placeholder = 'Écrivez quelque chose...',
    write_sign = 'La signer',
    write_place = 'La poser',
    write_cancel = 'Annuler',
    read_close = 'Fermer',
    read_remove = 'La retirer',
    read_unsigned = 'Non signée',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Poser la note~n~~INPUT_CELLPHONE_CANCEL~ Annuler',
    place_help_floor = '~INPUT_PICKUP~ Poser la note~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ La tourner~n~~INPUT_CELLPHONE_CANCEL~ Annuler',
    place_help_none = 'Regardez un mur, une table ou le sol pour poser votre note.~n~~INPUT_CELLPHONE_CANCEL~ Annuler',
    read_help = '~INPUT_PICKUP~ Lire la note',

    cancelled = 'Note rangée.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Ce type de note n\'est pas disponible.',
    refused_empty = 'La note est vide.',
    refused_too_long = 'Cette note est trop longue.',
    refused_cooldown = 'Attendez {seconds} secondes entre deux notes.',
    refused_player_limit = 'Vous avez déjà {limit} notes posées. Retirez-en une d\'abord.',
    refused_server_limit = 'Il y a trop de notes. Réessayez plus tard.',
    refused_too_far = 'C\'est trop loin.',
    refused_no_identifier = 'Vos notes ne peuvent pas être enregistrées pour le moment.',
    refused_not_yours = 'Vous ne pouvez retirer que vos propres notes.',
}
