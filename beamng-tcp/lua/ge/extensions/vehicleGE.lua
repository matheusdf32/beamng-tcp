
local M = {}

local veh = {}
local veht = false

local info = {}

M.setNewInfo = function(payload) -- payload already encoded in a string
    -- this will send the JSON recieved from outside-server to the VE
    veh:queueLuaCommand("vehicleVE.setNewInfo(\'".. payload .."\')")
end

M.setInfo = function(payload) --sets local info. This is used in vehicleVE via queueLuaCommand
    info = jsonDecode(payload)
end

M.getInfo = function() -- gets all the info sent from vehicleVE and stores in local info, then returns to the networkGE or any other script
    veh:queueLuaCommand("vehicleVE.getInfo()")
    return info
end

M.getVeh = function()
    return veh
end

M.onUpdate = function()
    if not veht then
        veh = be:getPlayerVehicle(0)
        if veh then
            veht = true
            veh:queueLuaCommand("extensions.addModulePath('lua/vehicle/extensions/Test')") -- Load lua files
            veh:queueLuaCommand("extensions.loadModulesInDirectory('lua/vehicle/extensions/Test')")
        end
    elseif not veh then
        log("D", "mainnnn.init", " not veh? ") -- this shouldnt happen
    -- else
    --     log("D", "mainnnn.init", be:getObjectCount())
    end
end

return M

