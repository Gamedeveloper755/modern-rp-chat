RegisterCommand("me", function(source, args)
    local msg = table.concat(args, " ")
    local name = GetPlayerName(source)
    TriggerClientEvent("modern_chat:addMessage", -1, {
        name = "* " .. name,
        message = msg,
        color = "#ffcc00"
    })
end, false)

RegisterCommand("ooc", function(source, args)
    local msg = table.concat(args, " ")
    local name = GetPlayerName(source)
    TriggerClientEvent("modern_chat:addMessage", -1, {
        name = "[OOC] " .. name,
        message = msg,
        color = "#b8b8b8"
    })
end, false)

RegisterCommand("announce", function(source, args)
    local msg = table.concat(args, " ")
    local name = GetPlayerName(source)
    TriggerClientEvent("modern_chat:addMessage", -1, {
        name = "[ANNUNCIO STAFF]",
        message = msg,
        color = "#ff4444"
    })
end, false)
RegisterCommand("staff", function(source, args)
    local msg = table.concat(args, " ")
    if msg == "" then return end

    local name = GetPlayerName(source)
    local ids = GetPlayerIdentifiers(source)

    local function isAdmin(src)
        local ids = GetPlayerIdentifiers(src)
        for _, id in ipairs(ids) do
            for _, admin in ipairs(Config.Admins) do
                if string.find(id, admin, 1, true) then
                    return true
                end
            end
        end
        return false
    end

    if not isAdmin(source) then
        TriggerClientEvent("modern_chat:addMessage", source, {
            name = "[SISTEMA]",
            message = "❌ Non hai i permessi per usare /staff",
            color = Config.Colors.system
        })
        return
    end

    for _, playerId in ipairs(GetPlayers()) do
        if isAdmin(playerId) then
            TriggerClientEvent("modern_chat:addMessage", playerId, {
                name = "[STAFF] " .. name,
                message = msg,
                color = Config.Colors.staff
            })
        end
    end
end, false)
RegisterCommand("pm", function(source, args)
    local target = tonumber(args[1])
    table.remove(args, 1)
    local msg = table.concat(args, " ")
    local name = GetPlayerName(source)

    if not target or msg == "" then
        TriggerClientEvent("modern_chat:addMessage", source, {
            name = "[SISTEMA]",
            message = "Uso corretto: /pm <id> <messaggio>",
            color = Config.Colors.system
        })
        return
    end

    if GetPlayerName(target) then
        TriggerClientEvent("modern_chat:addMessage", target, {
            name = "[PM] " .. name,
            message = msg,
            color = "#7dcf85"
        })
        TriggerClientEvent("modern_chat:addMessage", source, {
            name = "[PM -> " .. GetPlayerName(target) .. "]",
            message = msg,
            color = "#7dcf85"
        })
    else
        TriggerClientEvent("modern_chat:addMessage", source, {
            name = "[SISTEMA]",
            message = "⚠️ Giocatore non trovato.",
            color = Config.Colors.system
        })
    end
end, false)
