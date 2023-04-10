-- Scale bag container frames
for i=1,5 do
	_G["ContainerFrame"..i]:SetScale(0.9)
	_G["ContainerFrame"..i].SetScale = function() end
end