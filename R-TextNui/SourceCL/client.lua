local data_message = {}

function addText(id, label, keybind, type_show)
    if not data_message[id] then
        SendNUIMessage({action = 'addText', id = id, label = label, keybind = keybind, type_show = type_show, sound = 'level-up.mp3', volume = 0.8})
        data_message[id] = true
    end
end

function deleteText(id)
    if data_message[id] then
        SendNUIMessage({action = 'delete_data', id = id, sound = 'level-up.mp3', volume = 0.8})
        data_message[id] = nil
    end
end

exports('addText', addText)
exports('deleteText', deleteText)