
// If the Inventory is open
if (visible)
    {
    if (on == onTitle)
        {
        if (keyboard_check_pressed(vk_left))  {
            visible = false;
            with (parPauseMenu) on = onTitle;
            objSaveLoad.visible = true;
        }
        if (keyboard_check_pressed(vk_right)) {
            visible = false;
            with (parPauseMenu) on = onTitle;
            objOptions.visible = true;
        }
        if (keyboard_check_pressed(vk_down))
            on = onInventory;
            selection = 0;
        }
        
    else if (on == onCloseButton)
        {
        if (keyboard_check_pressed(vk_up))
            on = onInventory;
            //onCloseButton = false;
        }
    else
        {
        if (keyboard_check_pressed(vk_right))
            {
            if (on == onWeapon)
                on = onArmour;
            
            else if (on == onArmour)
                {}
                
            else
                {
                if (selection == floor(selection/invWidth)*invWidth+invWidth-1)
                    on = onWeapon;
                
                selection += (selection+1 < floor(selection/invWidth)*invWidth+invWidth);
                }
            }
        if (keyboard_check_pressed(vk_left))
            {
            if (on == onWeapon)
                on = onInventory;
            
            else if (on == onArmour)
                on = onWeapon;
                
            else
                selection -= (selection > floor(selection/invWidth)*invWidth);
            }
        
        if (keyboard_check_pressed(vk_up))
            {
            if (selection/invWidth < 1)
            || (on == onWeapon)
            || (on == onArmour)
                on = onTitle;
            else
                selection -= (selection/invWidth >= 1)*invWidth;
            }
        if (keyboard_check_pressed(vk_down))
            {
            if (selection/invWidth >= invHeight-1)
                on = onCloseButton;
            else
                selection += (selection/invWidth < invHeight-1)*invWidth;
            }
        }

    // Equip item / close inventory
    if (keyboard_check_pressed(KEY_INVENTORY_EQUIP))
        {
        // Close
        if (on == onCloseButton)
            visible = false;
            
        // Equip
        else
            {
            var _newItem;
            _newItem = ItemExtractArray(slots, selection);
            switch (_newItem[ITEM_TYPE])
                {
                // Equip a weapon
                case (ITEM_TYPE_WEAPON):
                    ItemInsertArray(slots, selection, objPlayer.equippedWeapon);
                    objPlayer.equippedWeapon = _newItem;
                    break;
                    
                // Consume a health potion
                case (ITEM_TYPE_POTION_HEALTH):
                    if (objPlayer.life < objPlayer.hearts)
                        {
                        objPlayer.life++;
                        if (--_newItem[ITEM_COUNT] <= 0)
                            ItemClear(slots, selection);
                        else
                            ItemInsertArray(slots, selection, _newItem);
                        }
                    break;
                }
            }
        }
    
    // Move item
    if (keyboard_check_pressed(KEY_INVENTORY_MOVE))
        {
        }
    }


