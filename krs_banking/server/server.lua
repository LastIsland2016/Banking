-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄▀██ ▄▄▄██ ▄▄ ██ ▄▄▄ ██ ▄▄▄ █▄ ▄█▄▄ ▄▄
-- ██ ██ ██ ▄▄▄██ ▀▀ ██ ███ ██▄▄▄▀▀██ ████ ██
-- ██ ▀▀ ██ ▀▀▀██ █████ ▀▀▀ ██ ▀▀▀ █▀ ▀███ ██
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
RegisterNetEvent('krs_banking:deposita', function(importo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local sBanca = xPlayer.getAccount("bank").money
    local sContanti = xPlayer.getAccount("money").money
    if sContanti >= importo then
        xPlayer.removeAccountMoney("money", importo)
        xPlayer.addAccountMoney('bank', importo)
        TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = 'Vous avez déposé $' .. importo .. ' dans votre banque.', 5000})
    else
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Vous n\'avez pas assez d\'argent.', 5000})
    end
end)
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ███ █▄ ▄█▄▄ ▄▄██ ██ ██ ▄▄▀██ ▄▄▀█ ▄▄▀██ ███ 
-- ██ █ █ ██ ████ ████ ▄▄ ██ ██ ██ ▀▀▄█ ▀▀ ██ █ █ 
-- ██▄▀▄▀▄█▀ ▀███ ████ ██ ██ ▀▀ ██ ██ █ ██ ██▄▀▄▀▄
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
RegisterNetEvent('krs_banking:ritirare', function(importo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local sBanca = xPlayer.getAccount("bank").money
    local sContanti = xPlayer.getAccount("money").money
    if sBanca >= importo then
        xPlayer.removeAccountMoney("bank", importo)
        xPlayer.addMoney(importo)
        TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = 'Vous avez retiré $' .. importo .. ' dans votre banque.', 5000})
    else
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Vous n\'avez pas assez d\'argent dans votre banque.', 5000})
    end
end)
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- █▄▄ ▄▄██ ▄▄▀█ ▄▄▀██ ▀██ ██ ▄▄▄ ██ ▄▄▄██ ▄▄▄██ ▄▄▀
-- ███ ████ ▀▀▄█ ▀▀ ██ █ █ ██▄▄▄▀▀██ ▄▄███ ▄▄▄██ ▀▀▄
-- ███ ████ ██ █ ██ ██ ██▄ ██ ▀▀▀ ██ █████ ▀▀▀██ ██ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
RegisterNetEvent("krs_banking:trasferisci", function(importo, target)
    if source == target then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)

    if not xTarget then return end 

    local sBanca = xPlayer.getAccount("bank").money

    if sBanca >= importo then
        xPlayer.removeAccountMoney("bank", importo)
        xTarget.addAccountMoney('bank', importo)

        TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = "Vous avez transféré $" .. importo .. " a ID " .. target, 5000})
        TriggerClientEvent('ox_lib:notify', target, {type = 'success', description = "Vous avez reçu $" .. importo .. " de ID " .. source, 5000})
    else
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Vous n\'avez pas assez d\'argent dans votre banque.', 5000})
    end
end)
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- █▄ ▄██ ▀██ ██ ▄▄▄██ ▄▄▄ ████ ▄▄ ██ ████ ▄▄▀██ ███ ██ ▄▄▄██ ▄▄▀
-- ██ ███ █ █ ██ ▄▄███ ███ ████ ▀▀ ██ ████ ▀▀ ██▄▀▀▀▄██ ▄▄▄██ ▀▀▄
-- █▀ ▀██ ██▄ ██ █████ ▀▀▀ ████ █████ ▀▀ █ ██ ████ ████ ▀▀▀██ ██ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
lib.callback.register('krs_banking:infoPlayer', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    local nome = xPlayer.getName()
    local banca = xPlayer.getAccount("bank").money

    return nome, banca
end)
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄▀██ ██ ██ ███ ████ ▄▄▀██ ▄▄▀██ ▄▄▄██ ▄▄▀█▄ ▄█▄▄ ▄▄████ ▄▄▀█ ▄▄▀██ ▄▄▀██ ▄▄▀
-- ██ ▄▄▀██ ██ ██▄▀▀▀▄████ █████ ▀▀▄██ ▄▄▄██ ██ ██ ████ ██████ ████ ▀▀ ██ ▀▀▄██ ██ 
-- ██ ▀▀ ██▄▀▀▄████ ██████ ▀▀▄██ ██ ██ ▀▀▀██ ▀▀ █▀ ▀███ ██████ ▀▀▄█ ██ ██ ██ ██ ▀▀ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
RegisterNetEvent("krs_banking:buyCreditCard", function(metadata)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nomePlayer = xPlayer.getName()

    local card = exports.ox_inventory:Search(source, 'count', Config.items)
    local money = exports.ox_inventory:Search(source, 'count', 'money')

    if money >= Config.PriceCreditCard and card < 1 then
        exports.ox_inventory:RemoveItem(source, 'money', Config.PriceCreditCard)
        exports.ox_inventory:AddItem(source, Config.items, 1, {description = nomePlayer})
        TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = 'Vous avez acheté une carte de crédit.', 5000})
    elseif money < Config.PriceCreditCard then
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Vous n\'avez pas assez d\'argent.', 5000})
    elseif card >= 1 then
        TriggerClientEvent('ox_lib:notify', source, {type = 'inform', description = 'Vous avez déjà une carte de crédit.', 5000})
    end
end)