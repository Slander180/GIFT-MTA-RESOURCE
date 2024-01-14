local screenW, screenH = guiGetScreenSize()
CardBackGround = guiCreateStaticImage((screenW - 394) / 2, (screenH - 337) / 2, 394, 337, "Card-Back.png", false)
CardCode = guiCreateEdit(30, 180, 316, 38, "", false, CardBackGround)
CardPurchase = guiCreateStaticImage(213, 253, 135, 57, "Click.png", false, CardBackGround)
CardClose = guiCreateStaticImage(44, 253, 135, 57, "Click.png", false, CardBackGround)
guiSetVisible(CardBackGround, false)

addEventHandler("onClientGUIClick",root,
function ()
    if source == CardPurchase then
	  local token = guiGetText(CardCode)
	    triggerServerEvent("redeemReward",resourceRoot,token)
	elseif source == CardClose then
	    guiSetVisible(CardBackGround, false)
	    showCursor(false)
	end
end
)

addCommandHandler("gift",
function ()
    guiSetVisible(CardBackGround, true)
	showCursor(true)
end
)

addEvent("daryaftshod",true)
addEventHandler("daryaftshod", getRootElement(), function()
	local sound = playSound("done.mp3",false) 
end)