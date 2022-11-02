blipsBus = {}

local status = nil

RegisterServerEvent('Atomic_MetroArcher:createBusLine')
AddEventHandler('Atomic_MetroArcher:createBusLine', function(coords, active, args)
    status = active

    createBlip(coords, args, status)
end)

function createBlip(coords, args, status)
    if status == true then
        return
    end

	blip = GetBlipCoords(coords)

    if not DoesBlipExist(blip) then
        x, y, z = table.unpack(coords)
        blip = AddBlipForCoord(x, y, z)
        
        SetBlipSprite(blip, 513)

        table.insert(blipsBus, blip)
    end

end

end
