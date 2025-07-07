--Script by R.Name

-- ========== CONFIGURATION ==========
local item_to_buy = "door_pack" -- The store pack ID (e.g., "door_pack")
local repeat_count = 1          -- How many times to buy it
local delay_ms = 500            -- Delay between purchases
-- ===================================

function hook(v)
    if v[1]:find("add_tab_button") then
        return true
    end
    if v[0]:find("OnDialogRequest") then
    end
end

AddCallback("block dialog", "OnVarlist", hook)


-- Purchase function
function buyItem(item_id)
    SendPacket(2, "action|buy\nitem|" .. item_id)
    log(">> Buying pack: " .. item_id)
end

-- Loop the purchase
function repeatPurchase(item_id, times)
    for i = 1, times do
        buyItem(item_id)
        Sleep(delay_ms)
    end
    log(">> Finished buying " .. times .. "x " .. item_id)
end

-- Start process
repeatPurchase(item_to_buy, repeat_count)
