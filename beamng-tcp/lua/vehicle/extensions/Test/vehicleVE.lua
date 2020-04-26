local M = {}

-- M.values = { -- not working
--   throttle = 0,
--   brake = 0,
--   steering = 0,
--   clutch = 0,
--   wheelspeed = 0,
--   avgWheelAV = 0,
--   airspeed = 0,
--   horn = false
-- }

local info = { connected = 0 }

local newInfo = {}

M.getInfo = function() -- gets the info from this and stores in vehicleGE.info, called from vehicleGE.getInfo()
    obj:queueGameEngineLua("vehicleGE.setInfo(\'".. jsonEncode(info) .."\')")
end

M.setNewInfo = function(payload) -- decodes from string to lua table and stores localy on newinfo to be sent to the game
    newInfo = jsonDecode(payload)
end

M.updateGFX = function()
    -- print(info.speed)
    M.brake = 1
    if newInfo then
        for k, v in pairs(newInfo) do
            -- print(k .. " " .. v)
            if k == "throttle" then M.values.throttle = v
            elseif k == "throttle_input" then electrics.values.throttle = v
            elseif k == "brake" then M.values.brake = v
            elseif k == "brake_input" then M.values.brake = v
            elseif k == "steering" then M.values.steering = v
            elseif k == "steering_input" then electrics.values.steering_input = v
            elseif k == "speed" then electrics.values.wheelspeed = v
            elseif k == "connected" then info["isConnected"] = v
            end
        end 
        -- newInfo = {}
    end
    -- info["throttle"] = M.values.throttle
    info["throttle_input"] = electrics.values.throttle
    -- info["brake"] = M.values.brake
    -- info["brake_input"] = M.values.brake
    -- info["steering"] = M.values.steering
    info["steering_input"] = electrics.values.steering_input
    info["speed"] = electrics.values.wheelspeed
    -- info["brake"] = M.brake
end
 
return M