-- Credit: FatalEntity 

local AddOn = CreateFrame("Frame")
local OnEvent = function(self, event, ...) self[event](self, event, ...) end
AddOn:SetScript("OnEvent", OnEvent)

local function MERCHANT_SHOW(...)
	if CanMerchantRepair() then
		local cost = GetRepairAllCost()
		if cost > 0 and not IsShiftKeyDown() then
			
			if cost > GetMoney() then print("Santa says: Insufficient funds to repair! :(") end
			
			local gold = floor(math.abs(cost) / 10000)
			local silver = mod(floor(math.abs(cost) / 100), 100)
			local copper = mod(floor(math.abs(cost)), 100)

			if gold ~= 0 then
				cost = format("%s|cffffd700g|r %s|cffc7c7cfs|r %s|cffeda55fc|r", gold, silver, copper)
			elseif silver ~= 0 then
				cost = format("%s|cffc7c7cfs|r %s|cffeda55fc|r", silver, copper)
			else
				cost = format("%s|cffeda55fc|r", copper)
			end
			
			if CanGuildBankRepair() then
				RepairAllItems(1)
				if GetRepairAllCost() == 0 then
					print(format("Santa says: All items repaired using guild bank funds for %s.", cost))
				end
			end
			
			if GetRepairAllCost() then
				RepairAllItems()
				print(format("Santa says: All items repaired for %s.", cost))
			end
		end
	end
end

AddOn:RegisterEvent("MERCHANT_SHOW")
AddOn["MERCHANT_SHOW"] = MERCHANT_SHOW
