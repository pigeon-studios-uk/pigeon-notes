--[[
    Pigeon Notes: the rules and the maths.

    What a note may say, how it sits on a wall or floor, when it expires and who can take it down.
    Nothing here calls a native, so it can be tested outside the game. The server uses the same checks
    on everything a player's game sends, so a modified game can't get round them.
]]

Notes = {}

--- Tidies a note's text: Windows line breaks, control characters, trailing spaces, too many blank lines.
function Notes.clean(text)
    if type(text) ~= 'string' then return '' end
    text = text:gsub('\r\n?', '\n'):gsub('[%z\1-\8\11\12\14-\31\127]', '')
    text = text:gsub('[ \t]+\n', '\n'):gsub('\n\n\n+', '\n\n')
    return (text:match('^%s*(.-)%s*$'))
end

--- Length in characters, not bytes, so accented letters count once.
function Notes.length(text)
    local ok, count = pcall(utf8.len, text)
    return ok and count or #text
end

--[[
    Checks what a player wants to write. Returns the cleaned text, or nil and the reason:
        'style' · 'empty' · 'too_long'
]]
function Notes.validate(config, text, style)
    local styleInfo = type(style) == 'string' and config.Styles and config.Styles[style]
    if not styleInfo then return nil, 'style' end
    text = Notes.clean(text)
    if text == '' then return nil, 'empty' end
    if Notes.length(text) > (tonumber(styleInfo.maxLength) or 300) then return nil, 'too_long' end
    return text
end

--- GTA's heading for a direction: 0 is north (+Y), and it turns anticlockwise, so east is 270.
function Notes.heading(dx, dy)
    local heading = -math.deg(math.atan(dx, dy))
    return heading % 360
end

--[[
    How a note lies on the surface it's placed on, from the surface's normal (the direction it faces).
    Notes are flat props that lie face up on the ground, so:
        floor (facing up):  no pitch, turned to `spin`
        wall (facing out):  stood up (pitch 90), with its face turned out along the normal
    Returns 'floor' or 'wall' and pitch, roll, yaw; or nil for a slope or ceiling it can't go on.
]]
function Notes.surface(normal, spin)
    if normal.z > 0.7 then return 'floor', 0.0, 0.0, (spin or 0) % 360 end
    if math.abs(normal.z) < 0.35 then
        -- Pitching a face-up prop 90 degrees turns its face to its own -Y, so its +Y must point into the wall.
        return 'wall', 90.0, 0.0, Notes.heading(-normal.x, -normal.y)
    end
    return nil
end

--- True if a note has expired.
function Notes.expired(note, now, days)
    days = tonumber(days) or 0
    if days <= 0 then return false end
    return now - (tonumber(note.created) or now) > days * 86400
end

--[[
    Who can take a note down, from Config.WhoCanRemove:
        'author'  the player who wrote it, and staff
        'anyone'  anyone at all
        'staff'   staff only
]]
function Notes.canRemove(mode, note, identifier, staff)
    if staff then return true end
    if mode == 'anyone' then return true end
    if mode == 'staff' then return false end
    return identifier ~= nil and identifier == note.author
end

--- How many notes an author has.
function Notes.countBy(notes, author)
    local count = 0
    for _, note in pairs(notes) do
        if note.author == author then count = count + 1 end
    end
    return count
end
