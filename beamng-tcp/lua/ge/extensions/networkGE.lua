local M = {}
 
local host, port = "127.0.0.1", 4343
local socket = require("socket")
local tcp = socket.tcp()
tcp:settimeout(0.000000001)
local con = tcp:connect(host, port);
--note the newline below
local veh = {}
local info = {}

M.onUpdate = function()
    
    veh = vehicleGE.getVeh()
    if veh then

        info = vehicleGE.getInfo()
        tcp:send(jsonEncode(info));
        local s, errstatus, partial = tcp:receive()
        print(con)
        
        if errstatus == "closed" or not con then  
            tcp:close()
            tcp = socket.tcp()
            tcp:settimeout(0.000000001)
            con = tcp:connect(host, port)
            if con then 
                s, errstatus, partial = tcp:receive()
                print(S)
                print(errstatus)
                print(partial)
            end
        end

        if s then 
            vehicleGE.setNewInfo(s) -- enviando já em string
        else
            vehicleGE.setNewInfo('')
        end

    elseif not veh then 
        -- log("D", "test.aaa", "dfhedtgh") 
    end
    
end

return M