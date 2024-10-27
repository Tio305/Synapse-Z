-- Synapse Z
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

local window = library:AddWindow("Synapse Z", {
    main_color = Color3.fromRGB(10, 10, 10),
    min_size = Vector2.new(650, 350),
    can_resize = false,
})

local Editor = window:AddTab("Editor")
Editor:Show()

local console = Editor:AddConsole({ 
    ["y"] = 220,
    ["readonly"] = false,  
    ["source"] = "Lua",
})

Editor:AddButton("Execute", function()
    local scriptText = console:Get()
    local loadFunc, loadError = loadstring(scriptText)

    if loadFunc then
        local success, execError = pcall(loadFunc)
        if not success then
            warn("Script execution error: " .. execError)
        end
    else
        warn("Script load error: " .. loadError)
    end
end)
Editor:AddButton("Clear", function()
    console:Set("")
end)

local Scripts = window:AddTab("Scripts")

local function addScriptButton(name, url)
    Scripts:AddLabel(name)
    Scripts:AddButton("Execute", function()
        loadstring(game:HttpGet(url))()
    end)
end

addScriptButton("Infinite Yield", 'https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source')
addScriptButton("Prizzlife", 'https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua')
addScriptButton("Op guns (prison life)", "https://pastebin.com/raw/Dz5FRk17")
addScriptButton("Genesis Fe Hub", "https://pastebin.com/raw/LJPGydai")
addScriptButton("CMD-X", "https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source")

local Options = window:AddTab("Options")

Options:AddLabel("Executor Settings")
local switch = Options:AddSwitch("Console", function()
    -- script here
end)
switch:Set(false)
Options:AddLabel("UI Settings")
local dropdown = Options:AddDropdown("Open Key", function(text)
	if text == "LeftAlt" then  -- Code
		print("this does nothing im too lazy")
	elseif text == "Strg" then
	print("does nothing")
	elseif text == "LeftShift" then
	print("also does nothing")
	end
end)
local LeftAlt = dropdown:Add("LeftAlt")  -- Options 
local Strg = dropdown:Add("Strg")
local LeftShift = dropdown:Add("LeftShift")
