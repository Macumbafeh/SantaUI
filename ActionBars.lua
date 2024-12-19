local AddOn = CreateFrame("Frame")
local OnEvent = function(self, event, ...) self[event](self, event, ...) end
AddOn:SetScript("OnEvent", OnEvent)


local SantaUIDB_local
local events = {}
function events:ADDON_LOADED(...)
	if select(1, ...) == "SantaUI" then
		SantaUIDB_local = SantaUIDB
		if not SantaUIDB_local then -- addon loaded for first time
			SantaUIDB_local = {}
			print("SantaUI load default")
			SantaUIDB_local["point"] = "CENTER"
			SantaUIDB_local["relativePoint"] = "CENTER"
			SantaUIDB_local["xOffset"] = 0
			SantaUIDB_local["yOffset"] = 0
		end

		-- safe check all saved variables are there (in case older version was loaded)
		if not SantaUIDB_local["point"] then SantaUIDB_local["point"] = "CENTER" end
		if not SantaUIDB_local["relativePoint"] then SantaUIDB_local["relativePoint"] = "CENTER" end
		if not SantaUIDB_local["xOffset"] then SantaUIDB_local["xOffset"] = 0 end
		if not SantaUIDB_local["yOffset"] then SantaUIDB_local["yOffset"] = 0 end

		addon:UnregisterEvent("ADDON_LOADED")
		print("SantaUI Loaded")
	end
end

--- gets executed once all ui information is available (like honor etc)
function events:PLAYER_ENTERING_WORLD()
	ReapplyActionBarPosition()
    addon:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

function events:PLAYER_REGEN_ENABLED()
	ReapplyActionBarPosition()
    addon:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

function events:ZONE_CHANGED_NEW_AREA()
	ReapplyActionBarPosition()
    addon:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
end

function events:ACTIONBAR_SLOT_CHANGED()
	ReapplyActionBarPosition()
    addon:UnregisterEvent("ACTIONBAR_SLOT_CHANGED")
end

--- save variables to SavedVariables
function events:PLAYER_LOGOUT()
	SantaUIDB = SantaUIDB_local
end




-- Hide graphics  
for _, frame in ipairs({
  MainMenuBarLeftEndCap, 
  MainMenuBarRightEndCap, 
  MainMenuBarPageNumber, 
  MainMenuXPBarTexture2, 
  MainMenuXPBarTexture3, 
  MainMenuBarTexture2, 
  MainMenuBarTexture3, 
  MainMenuMaxLevelBar0,
  MainMenuMaxLevelBar1,
  MainMenuMaxLevelBar2, 
  MainMenuMaxLevelBar3, 
  MainMenuBarPerformanceBarFrame,
  ActionBarUpButton,
  ActionBarDownButton,
  -- BonusActionBarFrame,
  GameTimeFrame
  }) do
		frame:Hide()
end

for _, texture in ipairs({
  ReputationWatchBarTexture2, 
  ReputationWatchBarTexture3, 
  ReputationXPBarTexture2, 
  ReputationXPBarTexture3, 
  MainMenuBarTexture0, 
  MainMenuBarTexture1, 
  ReputationWatchBarTexture0, 
  ReputationWatchBarTexture1, 
  ReputationXPBarTexture0, 
  ReputationXPBarTexture1, 
  MainMenuBarLeftEndCap, 
  MainMenuBarRightEndCap, 
  MainMenuXPBarTexture0, 
  MainMenuXPBarTexture1, 
  MainMenuMaxLevelBar0, 
  MainMenuMaxLevelBar1, 
  PossessBackground1, 
  PossessBackground2
  }) do
	texture:SetTexture(nil)
end
-- BonusActionBarTexture0, BonusActionBarTexture1

local function OnDragStart(self)
    if( IsAltKeyDown() ) then
        self.isMoving = true
        self:StartMoving()
    end
end

local function OnDragStop(self)
    if( self.isMoving ) then
        self.isMoving = nil
        self:StopMovingOrSizing()
    end
end

-- Stance / Shapeshiftbar move
ShapeshiftBarFrame:ClearAllPoints()
ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", 10, 102)
ShapeshiftBarFrame:SetScale(1)
ShapeshiftBarFrame.SetPoint = function() end

-- Pet/Posses Action Bar move / move with alt on PetActionButton1
local frame = CreateFrame("Frame", "DragFrame2", UIParent)
PetActionButton1:ClearAllPoints()
PetActionButton1:SetMovable(true)
PetActionButton1:EnableMouse(true)
PetActionButton1:SetClampedToScreen(true)
PetActionButton1:RegisterForDrag("LeftButton")
PetActionButton1:SetScript("OnDragStart", OnDragStart)
PetActionButton1:SetScript("OnDragStop", OnDragStop)
PetActionButton1:SetPoint("BOTTOMLEFT", 10, 152)
PetActionButton1:SetScale(1)
PetActionButton1.SetPoint = function() end


PossessBarFrame:ClearAllPoints()
PossessBarFrame:SetPoint("BOTTOMLEFT", 250, 132)
PossessBarFrame:SetScale(1)
-- PossessBarFrame.SetPoint = function() end

PossessButton1:ClearAllPoints()
PossessButton1:SetPoint("BOTTOMLEFT", 0, 60)
PossessButton1:SetScale(1)


-- Scaling
MainMenuBar:SetScale(1)
MainMenuBar:SetWidth(510)
MultiBarBottomLeft:SetScale(1); MultiBarBottomRight:SetScale(1)
MultiBarRight:SetScale(1); MultiBarLeft:SetScale(1)

-- Bottom right actionbar

	MAX_PLAYER_LEVEL = 70
if UnitLevel("player") < MAX_PLAYER_LEVEL then
	MainMenuBar:ClearAllPoints()
    MainMenuBar:SetPoint("BOTTOM", UIParent, -110, 11)
	else
	MainMenuBar:ClearAllPoints()
	MainMenuBar:SetPoint("BOTTOM", UIParent, -110, 0)
end
-- MainMenuBar:ClearAllPoints()
-- MainMenuBar:SetPoint("BOTTOM", UIParent, -110, 11)

--reposition bottom right actionbar
MultiBarBottomRight:SetPoint("LEFT", MultiBarBottomLeft, "RIGHT", 5, 0)

--reposition second half of top right bar, underneath
MultiBarBottomRightButton7:SetPoint("LEFT", MainMenuBar, 513, -5)





-- Experience bar


MainMenuExpBar:SetScale(0.735)
ExhaustionTick:SetScale(0.735)
MainMenuExpBar:ClearAllPoints()
MainMenuExpBar:SetPoint("CENTER", ReputationWatchBar, 175, -82)

MainMenuBarExpText:SetPoint("TOP", MainMenuExpBar, 0, 1)
MainMenuBarExpText:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE");
ReputationWatchBar:SetScale(0.9)
ReputationWatchBar:SetWidth(500)
ReputationWatchStatusBar:SetScale(0.82)
ReputationWatchStatusBar:SetPoint("LEFT", ReputationWatchBar, -35, -54)
ReputationWatchStatusBarText:SetFont("Fonts\\FRIZQT__.TTF", 11.5, "OUTLINE");
ReputationWatchStatusBarText:SetPoint("TOP", ReputationWatchStatusBar, 0, 2)



-- ReputationWatchStatusBar:SetPoint("BOTTOMLEFT", -290, -2, -290, -2)

-- Paging
-- ActionBarUpButton:SetPoint("RIGHT", -22, 5)
ActionBarUpButton:SetAlpha(0)
-- ActionBarDownButton:SetPoint("RIGHT", -22, -16)
ActionBarDownButton:SetAlpha(0)


-- fix for bar overlap for warrior but remove bars stance
-- if select(2, UnitClass("player")) == "WARRIOR" then
--	local frame = CreateFrame("frame");
--	frame:RegisterEvent("PLAYER_ENTERING_WORLD");
--	local HIDE_BONUS_BARS = function()
--		BonusActionBarFrame:UnregisterAllEvents();
--		BonusActionBarFrame.Show = function() end
--		BonusActionBarFrame:Hide();
--	end
--	frame:SetScript("OnEvent", HIDE_BONUS_BARS);
-- end


-- Bags
local function OnDragStart(self)
    if( IsAltKeyDown() ) then
        self.isMoving = true
        self:StartMoving()
    end
end

local function OnDragStop(self)
    if( self.isMoving ) then
        self.isMoving = nil
        self:StopMovingOrSizing()
    end
	local point, _, relativePoint, xOfs, yOfs = self:GetPoint()


end

	MainMenuBarBackpackButton:ClearAllPoints()
	MainMenuBarBackpackButton:SetMovable(true)
	MainMenuBarBackpackButton:EnableMouse(true)
	MainMenuBarBackpackButton:SetClampedToScreen(true)
	MainMenuBarBackpackButton:RegisterForDrag("LeftButton")
	MainMenuBarBackpackButton:SetScript("OnDragStart", OnDragStart)
	MainMenuBarBackpackButton:SetScript("OnDragStop", OnDragStop)
	MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", "Minimap", "BOTTOMRIGHT", 10, -1030)
	MainMenuBarBackpackButton:SetScale(1)

-- MainMenuBarBackpackButton:SetAlpha(0)
CharacterBag0Slot:SetScale(1)
CharacterBag1Slot:SetScale(1)
CharacterBag2Slot:SetScale(1)
CharacterBag3Slot:SetScale(1)
KeyRingButton:SetScale(1)



-- Micro menu
-- Configuration to set the position of CharacterMicroButton
local isAboveBags = true -- Default to "above bags". Change to `false` for "below bags".

-- Function to set the position of the CharacterMicroButton
local function SetCharacterMicroButtonPosition()
    if InCombatLockdown() then
        -- Retry after leaving combat
        local f = CreateFrame("Frame")
        f:RegisterEvent("PLAYER_REGEN_ENABLED")
        f:SetScript("OnEvent", function()
            SetCharacterMicroButtonPosition()
            f:UnregisterEvent("PLAYER_REGEN_ENABLED")
        end)
        return
    end
	
    CharacterMicroButton:ClearAllPoints()
    if isAboveBags then
        -- Position above the bags
        CharacterMicroButton:SetPoint("BOTTOMRIGHT", "MainMenuBarBackpackButton", "BOTTOMRIGHT", -223, 43)
		if UnitLevel("player") < MAX_PLAYER_LEVEL then
			MainMenuBar:ClearAllPoints()
			MainMenuBar:SetPoint("BOTTOM", UIParent, -110, 11)
		else
			MainMenuBar:ClearAllPoints()
			MainMenuBar:SetPoint("BOTTOM", UIParent, -110, 0)
		end
    else
        -- Position below the bags
        CharacterMicroButton:SetPoint("BOTTOMRIGHT", "MainMenuBarBackpackButton", "BOTTOMRIGHT", -223, -40)
		if UnitLevel("player") < MAX_PLAYER_LEVEL then
			MainMenuBar:ClearAllPoints()
			MainMenuBar:SetPoint("BOTTOM", UIParent, -110, 11)
		else
			MainMenuBar:ClearAllPoints()
			MainMenuBar:SetPoint("BOTTOM", UIParent, -110, 0)
		end
    end
end

-- Event handlers
local function PLAYER_ENTERING_WORLD()
    SetCharacterMicroButtonPosition()
end

local function PLAYER_REGEN_ENABLED()
    SetCharacterMicroButtonPosition()
end

local function ZONE_CHANGED_NEW_AREA()
    SetCharacterMicroButtonPosition()
end

local function ACTIONBAR_SLOT_CHANGED()
    SetCharacterMicroButtonPosition()
end

-- Add a slash command to toggle the position dynamically
SLASH_TOGGLEMICROBUTTON1 = "/movemicrobutton"
SlashCmdList["TOGGLEMICROBUTTON"] = function()
    isAboveBags = not isAboveBags
    SetCharacterMicroButtonPosition()
    print("Character Micro Button is now " .. (isAboveBags and "above" or "below") .. " the bags.")
end

-- Register the event handlers
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("ACTIONBAR_SLOT_CHANGED")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        PLAYER_ENTERING_WORLD()
    elseif event == "PLAYER_REGEN_ENABLED" then
        PLAYER_REGEN_ENABLED()
	elseif event == "ZONE_CHANGED_NEW_AREA" then
		ZONE_CHANGED_NEW_AREA()
	elseif event == "ACTIONBAR_SLOT_CHANGED" then
		ACTIONBAR_SLOT_CHANGED()
    end
end)

local function ReapplyActionBarPosition()
    if UnitLevel("player") < MAX_PLAYER_LEVEL then
		MainMenuBar:ClearAllPoints()
		MainMenuBar:SetPoint("BOTTOM", UIParent, -110, 11)
	else
		MainMenuBar:ClearAllPoints()
		MainMenuBar:SetPoint("BOTTOM", UIParent, -110, 0)
	end
end

local inCombat = false
local events = CreateFrame("Frame")
events:RegisterEvent("ZONE_CHANGED_NEW_AREA")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("PLAYER_REGEN_ENABLED")
events:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_REGEN_ENABLED" then
		inCombat = false
        ReapplyActionBarPosition()
	elseif event == "PLAYER_REGEN_DISABLED" then
        inCombat = true
	elseif not inCombat then
        ReapplyActionBarPosition()
    else
        ReapplyActionBarPosition()
    end
end)



do
	local b = {
		"CharacterMicroButton",
		"SpellbookMicroButton",
		"TalentMicroButton",
		"QuestLogMicroButton",
		"SocialsMicroButton",
		"LFDMicroButton",
		"MainMenuMicroButton",
		"AchievementMicroButton",
		"HelpMicroButton",
		"PVPMicroButton",
		-- "CollectionsMicroButton"
		}
	for k, v in pairs(b) do
		_G[v]:SetScale(0.9)
		_G[v]:SetAlpha(1)
	end
end


-- Ghetto fix for the micro menu resetting it's postition sometimes
local f = CreateFrame("Frame", UIParent)
f:SetHeight(20)
f:SetWidth(140)
if isAboveBags then
        -- Position above the bags
        f:SetPoint("BOTTOMRIGHT", "MainMenuBarBackpackButton", "BOTTOMRIGHT", -223, 43)
    else
        -- Position below the bags
        f:SetPoint("BOTTOMRIGHT", "MainMenuBarBackpackButton", "BOTTOMRIGHT", -223, -40)
    end
f:SetPoint("BOTTOMRIGHT", "MainMenuBarBackpackButton", "BOTTOMRIGHT", -223, -40)

local fixMicroMenu = function(frame)
	local resetPos = function()
		CharacterMicroButton:ClearAllPoints()
		if isAboveBags then
        -- Position above the bags
        CharacterMicroButton:SetPoint("BOTTOMRIGHT", "MainMenuBarBackpackButton", "BOTTOMRIGHT", -223, 43)
    else
        -- Position below the bags
        CharacterMicroButton:SetPoint("BOTTOMRIGHT", "MainMenuBarBackpackButton", "BOTTOMRIGHT", -223, -40)
    end
	end

	frame:EnableMouse(true)
	frame:HookScript("OnEnter", resetPos)
end

fixMicroMenu(f)

-- Show/hide frame on mouseover
local enableMouseOver = function(frame, includeChildren)
	local show = function()
		frame:SetAlpha(1)
	end

	local hide = function()
		frame:SetAlpha(0)
	end
	
	if includeChildren then
			for _, child in ipairs({frame:GetChildren()}) do
				child:HookScript("OnEnter", show)
				child:HookScript("OnLeave", hide)
			end
		end

	frame:EnableMouse(true)
	frame:HookScript("OnEnter", show)
	frame:HookScript("OnLeave", hide)
	hide()
end




BonusActionBarTexture0:Hide()
BonusActionBarTexture1:Hide()



-- enableMouseOver(ActionBarUpButton, true)
-- enableMouseOver(ActionBarDownButton, true)
-- enableMouseOver(PetActionBarFrame, true)
enableMouseOver(ShapeshiftBarFrame, true)

AddOn:RegisterEvent("PLAYER_ENTERING_WORLD")
AddOn:RegisterEvent("PLAYER_REGEN_ENABLED")
AddOn:RegisterEvent("ZONE_CHANGED_NEW_AREA")
AddOn["PLAYER_REGEN_ENABLED"] = PLAYER_REGEN_ENABLED
AddOn["PLAYER_ENTERING_WORLD"] = PLAYER_ENTERING_WORLD
AddOn["ZONE_CHANGED_NEW_AREA"] = ZONE_CHANGED_NEW_AREA
AddOn["ACTIONBAR_SLOT_CHANGED"] = ACTIONBAR_SLOT_CHANGED
