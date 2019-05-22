--Softmod's Global variables and sane defaults
FactoCord = FactoCord or {}
FactoCord.events = FactoCord.events or {}
if FactoCord.events.deaths == nil then
    FactoCord.events.deaths = true
end
if FactoCord.events.research == nil then
    FactoCord.events.research = true
end
if FactoCord.events.rocket == nil then
    FactoCord.events.rocket = true
end


--/FactoCord command and helper functions
local function log_message(tick, msg)
    print(tick .. " [FACTOCORD] " .. msg)
end

local function FactoCord(name, tick, player_index, parameter)
    local playerName
    if player_index == nil or player_index < 1 then
        playerName = "server"
    else
        playerName = game.players[player_index].name
    end

    local msg = '[FACTOCORD] {"name":"' .. name .. '","playerName":"' .. playerName .. '","tick":' .. tick .. '","parameter":"' .. parameter .. '"}'
    game.players[player_index].print(msg)
    log_message(tick, msg)
end

add_command("FactoCord", "SoftMod function used by FactoCord bot", FactoCord)

--EVENTS HANDLERS and FUNCTIONS for factorio -> discord
local function log_event(event, msg)
    print(event.tick .. " [EVENT] " .. msg)
end

local function log_player_message(event, msg_in)
    local msg = "Player " .. game.players[event.player_index].name .. " " .. msg_in .. "."
    log_event(event, msg)
end

local function log_player_death_message(event, msg_in)
    local cs = event.cause.name
    local msg = "" .. game.players[event.player_index].name .. " was killed by " .. cs .. "!"
    log_event(event, msg)
end

local function log_research_message(event, msg_in)
    local msg = msg_in .. " \"" .. event.research.name .. "\""
    log_event(event, msg)
end

script.on_event(defines.events.on_player_died, function(event)
    if FactoCord.events.deaths then
        log_player_death_message(event, "")
    end
end)
script.on_event(defines.events.on_research_started, function(event)
    if FactoCord.events.research then
        log_research_message(event, "Started research of")
    end
end)
script.on_event(defines.events.on_research_finished, function(event)
    if FactoCord.events.research then
        log_research_message(event, "Research finished for")
    end
end)
script.on_event(defines.events.on_rocket_launched, function(event)
    if FactoCord.events.rocket then
        log_event("A rocket was launched.")
    end
end)
