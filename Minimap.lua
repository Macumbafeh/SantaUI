-- Clean it up
MinimapCluster:SetScale(1)
MinimapCluster:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT", 2, 0)
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
MiniMapWorldMapButton:Hide()
MinimapZoneTextButton:Show()
MinimapBorderTop:Show()

-- Minimap scrolling (Credit: Thek)
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function() 
    if ( arg1 > 0 and Minimap:GetZoom() < 5 ) then 
	Minimap:SetZoom(Minimap:GetZoom() + 1 )
    elseif ( arg1 < 0 and Minimap:GetZoom() > 0 ) then 
	Minimap:SetZoom(Minimap:GetZoom() - 1 ) 
    end
end)