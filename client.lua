local FrameworkGetterEvent = 'esx:getSharedObject'

Framework = nil

Citizen.CreateThread(function()
    while Framework == nil do
	TriggerEvent(FrameworkGetterEvent,function(n)
		Framework = n
	end)
    Wait(5)
    end
end)

local VehiclelistToGen = {
	'18performante',
	'20x5m',
	'a45',
	'bg700w',
	'bmwm8',
	'kx450f',
	'pts21',
	'rmodbolide',
	'rmodbugatti',
	'rmodgt63',
	'rmodmi8lb',
	'rmodrs6',
	'rs7r',
	'rs318',
	'tmaxDX',
	'urus',
	'veneno',
	'xadv'
}

local finalstring = ""
local generatedhashes = 0

RegisterCommand('genhashes', function()
    WriteLineOnString("local vehicles = {")
	for k, v in pairs(VehiclelistToGen) do
    Framework.Game.SpawnVehicle(v, {x = 0.0,y = 0.0, z = 0.0}, 0.0, function (vehicle)
		local vehicleProps = Framework.Game.GetVehicleProperties(vehicle)
        DeleteEntity(vehicle)
        local add = ","
        WriteLineOnString("['" .. v .. "'] = " .. "" .. vehicleProps.model .. add)
        generatedhashes = generatedhashes + 1
	end)
    end
    while #VehiclelistToGen > generatedhashes do
        Wait(0)
    end
    WriteLineOnString("}")
    TriggerServerEvent('keepcool:WriteString', finalstring)
end, false)

function WriteLineOnString(line)
    if finalstring ~= "" then
        finalstring = finalstring .. "\n"
    end
    finalstring = finalstring .. line
end