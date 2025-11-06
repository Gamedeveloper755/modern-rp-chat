RegisterNetEvent('modern_chat:addMessage')
AddEventHandler('modern_chat:addMessage', function(data)
    SendNUIMessage({
        action = "addMessage",
        name = data.name or "",
        message = data.message or "",
        color = data.color or "#ffffff"
    })
end)

RegisterNetEvent('modern_chat:clear')
AddEventHandler('modern_chat:clear', function()
    SendNUIMessage({ action = "clear" })
end)

RegisterCommand("clear", function()
    TriggerEvent("modern_chat:clear")
end, false)
