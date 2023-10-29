local frame = CreateFrame("Frame")

local function OnEvent(self, event, arg1)
    if event == "CHAT_MSG_SYSTEM" then
        if string.find(arg1, "You have been outbid on") then
            PlaySoundFile("Interface\\AddOns\\lazyBMAH\\sound\\outbid.mp3") 
        end
    end
end

frame:RegisterEvent("CHAT_MSG_SYSTEM")
frame:SetScript("OnEvent", OnEvent)