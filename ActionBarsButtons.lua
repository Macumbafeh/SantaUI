local defaultStubs = {
    ActionButton=12, MultiBarRightButton=12,
    MultiBarLeftButton=12, MultiBarBottomRightButton=12,
    MultiBarBottomLeftButton=12, StanceButton=10, PetActionButton=10,
    BonusActionButton=12,
}
for stub,numButtons in pairs(defaultStubs) do
  for i=1,numButtons do
	local stub = f
		if f then
		_G[stub..i.."HotKey"]:SetFont("Fonts\\ARIALN.ttf",12,"OUTLINE,THICKOUTLINE")
		end
  end
end

-- ,THICKOUTLINE, MONOCHROME
