QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
ishold = false

QBCore.Commands.Add("onalert", "تفعيل الاستنفار الامنى", {}, false, function(source, args)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "police" then
		TriggerEvent('JK_Policealert:Server:isOnAlert')
	else
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "لا يمكنك استعمال هذا الامر")
    end
end)

QBCore.Commands.Add("offalert", "ايقاف الاستنفار الامنى", {}, false, function(source, args)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "police" then
		TriggerEvent('JK_Policealert:Server:isOffAlert')
	else
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "لا يمكنك استعمال هذا الامر")
    end
end)

RegisterNetEvent('JK_Policealert:Server:isOnAlert')
AddEventHandler('JK_Policealert:Server:isOnAlert', function()
	ishold = true
	Citizen.Wait(1)
	TriggerClientEvent('chatMessage',-1, "SYSTEM", "error", "تم تفعيل الاستنفار الامنى يرجى الابتعاد عن المنطقة الموضحة بالجي بي اس")
	TriggerClientEvent('JK_Policealert:Client:UpdateAlert', -1, ishold)
end)

RegisterNetEvent('JK_Policealert:Server:isOffAlert')
AddEventHandler('JK_Policealert:Server:isOffAlert', function()
	ishold = false
	TriggerClientEvent('chatMessage',-1, "SYSTEM", "error", "تم ايقاف الاستنفار الامنى")
	TriggerClientEvent('JK_Policealert:Client:UpdateAlert', -1, ishold)
end)