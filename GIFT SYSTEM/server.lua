local accSys = exports["Accounts"]

addEvent("redeemReward",true)
addEventHandler("redeemReward", root,
function (token)
	if token ~= "" then
	  local xml = xmlLoadFile("tokens.xml")
	  local name = getPlayerName(client)
      local xmlRoot = xmlFindChild (xml,"config",0)
        if (xmlRoot) then
            for i,v in ipairs (xmlNodeGetChildren(xmlRoot)) do
	          local used = xmlNodeGetAttribute(v, "used")
	          local code = xmlNodeGetAttribute(v, "code")
	          local prize = xmlNodeGetAttribute(v, "prize")
			  local goldash = getElementData(accSys:getPlayerAcc(client),"pGold")
	            if token == code and used ~= "true" then
					setElementData(accSys:getPlayerAcc(client),"pGold",goldash+prize)
		            outputChatBox("#00ff00[Card]: #ffffffMeghdare #00ff00"..prize.." #ffffffGold Be Hesab Shoma Ezafe Shod!",client,255,255,0,true)
					triggerClientEvent(client, "daryaftshod", resourceRoot)
			        xmlNodeSetAttribute(v,"used","true")
					xmlNodeSetAttribute(v,"player",name)
					xmlSaveFile(xml)
				elseif token == code and used == "true" then
					outputChatBox("#ff0000[Error]: #ffffffToken Shoma Az Ghabl Estefade Shode Ast!", client, 255, 255, 255, true)
		        end
			end
		end
		else
			outputChatBox("#ff0000[Error]: #ffffffToken Ra Vared Konid!", client, 255, 255, 255, true)
		end
end)
