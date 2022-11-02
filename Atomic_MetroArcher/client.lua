HasGPSActivated = false
coords = {}

blipsBus = {}

RegisterCommand('busgps', function(source, args)
    
    if HasGPSActivated == false then
        HasGPSActivated = true

        exports.pNotify:SendNotification({
            text = "Deaktiviert", 
            type = "error", 
            timeout = math.random(1000, 10000),
            layout = "centerLeft",
            queue = "left"
        })
        
    else
        exports.pNotify:SendNotification({
            text = "Aktiviert", 
            type = "success", 
            timeout = math.random(1000, 10000),
            layout = "centerLeft",
            queue = "left"
        })

        Citizen.CreateThread(function()
            while true do

                blip = GetBlipCoords(GetEntityCoords(GetPlayerPed(-1)))

                if not DoesBlipExist(blip) then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
                    blip = AddBlipForCoord(x, y, z)
        
                    SetBlipSprite(blip, 513)

                    table.insert(blipsBus, blip)
                end

                Wait(2000)
            end
        end)
        
        HasGPSActivated = false 
    end

end, false)