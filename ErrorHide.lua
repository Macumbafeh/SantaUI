-- CREDIT: FatalEntity 

local AddOn = CreateFrame("Frame")
local OnEvent = function(self, event, ...) self[event](self, event, ...) end
AddOn:SetScript("OnEvent", OnEvent)


local function PLAYER_REGEN_DISABLED()
	UIErrorsFrame:Hide()
end

local function PLAYER_REGEN_ENABLED()
	UIErrorsFrame:Show()
end


AddOn:RegisterEvent("PLAYER_REGEN_DISABLED")
AddOn["PLAYER_REGEN_DISABLED"] = PLAYER_REGEN_DISABLED

AddOn:RegisterEvent("PLAYER_REGEN_ENABLED")
AddOn["PLAYER_REGEN_ENABLED"] = PLAYER_REGEN_ENABLED
