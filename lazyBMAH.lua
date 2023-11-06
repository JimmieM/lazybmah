local frame = CreateFrame("Frame")

local function displayWarningFrameText(arg1)
    local warningFrame = CreateFrame("Frame", nil, UIParent)
    warningFrame:SetSize(400, 100)
    warningFrame:SetPoint("CENTER", UIParent, "CENTER", 0, UIParent:GetHeight() / 4)

    local warningText = warningFrame:CreateFontString(nil, "ARTWORK", "GameFont_Gigantic")
    warningText:SetPoint("CENTER")
    warningText:SetText(arg1)
    warningText:SetTextColor(1, 1, 1)
    warningText:SetFont(warningText:GetFont(), 20, "OUTLINE")

    warningFrame:Show()

    C_Timer.After(3, function() warningFrame:Hide() end)
end

local function OnEvent(_, event, arg1)
    if event == "CHAT_MSG_SYSTEM" then
        if string.find(arg1, "You have been outbid on") then
            PlaySoundFile("Interface\\AddOns\\lazyBMAH\\sound\\outbid.mp3") 
            displayWarningFrameText(arg1)
        end
        if string.find(arg1, "You have won an auction for") then
            PlaySoundFile("Interface\\AddOns\\lazyBMAH\\sound\\auction_won.mp3") 
            displayWarningFrameText(arg1)
        end
    end 
end

frame:RegisterEvent("CHAT_MSG_SYSTEM")
frame:SetScript("OnEvent", OnEvent)