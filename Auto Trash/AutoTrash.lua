--Script by R.Name
--Turn on fast trash first

-- ========== CONFIGURATION ==========
local item_ids = { 4584 }           --change the item id you want to trash
-- ===================================

function dialogbox()
    varlist = {}
    varlist[0] = "OnDialogRequest"
    varlist[1] = [[
dialog_name|proxy_main_cmd
set_default_color|`o
add_label_with_icon|big|`3Auto Trash Script``|left|1790|
add_spacer|small|
add_textbox|`9This Script was made By : `1RNAMES|left|
add_spacer|small|
add_label_with_icon|small|`9This Script Is Free|left|1432|
add_label_with_icon|small|`4PLEASE TURN ON THE FAST TRASH FIRST|left|1432|
add_spacer|small|
add_spacer|small|
add_quick_exit|
end_dialog|proxy_main_cmd|Okay|
]]
    varlist.netid = -1
    SendVarlist(varlist)
end

function count(id)
    local count = 0
    for _, inv in pairs(GetInventory()) do
        if id < 0 then
            id = 13940 + id
        end
        if inv.id == id then
            count = count + inv.count
        end
    end
    return count
end

function main()
    dialogbox()
    while true do
        -- Trash logic
        for i = 1, #item_ids do
            local item_count = count(item_ids[i])

            if item_count > 100 then
                SendPacket(2, "action|trash\nitemID|" .. item_ids[i])
                Sleep(500)
                --SendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..item_ids[i].. "\ncount|"..item_count)
            end

            Sleep(20)
        end
        Sleep(100)
    end
end

main()
