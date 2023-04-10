
-- CONFIGURATION ----------------------------------

local focus_castbar_centered = true

-- END OF CONFIG ----------------------------------




-- Player castbar
UIPARENT_MANAGED_FRAME_POSITIONS["CastingBarFrame"] = nil 
CastingBarFrame:ClearAllPoints()
CastingBarFrame:SetPoint("BOTTOM", 0, 150)
CastingBarFrame:SetScale(1.1)


-- Target castbar
TargetFrameSpellBar:SetScale(1.08)


-- Focus castbar
if focus_castbar_centered then
	hooksecurefunc(FocusFrameSpellBar, "Show", function()
		FocusFrameSpellBar:SetScale(1.8)
		FocusFrameSpellBar:ClearAllPoints()
		FocusFrameSpellBar:SetPoint("CENTER", UIParent, "CENTER", 0, 60)
		FocusFrameSpellBar.SetPoint = function() end
	end)
end