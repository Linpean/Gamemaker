
if (visible)
&& (!instance_exists(objConfirmation))
    {
    if (keyboard_check_pressed(vk_right))
        {
        if (on == onTitle)
            {
            visible = false;
            objInventory.visible = true;
            }
        }
        
    if (keyboard_check_pressed(vk_up))
        {
        switch (on)
            {
            case (onSaveContButton): on = onTitle; break;
            case (onSaveQuitButton): on = onSaveContButton; break;
            case (onLoadButton):     on = onSaveQuitButton; break;
            case (onCloseButton):    on = onLoadButton; break;
            }
        }
    
    if (keyboard_check_pressed(vk_down))
        {
        switch (on)
            {
            case (onTitle):          on = onSaveContButton; break;
            case (onSaveContButton): on = onSaveQuitButton; break;
            case (onSaveQuitButton): on = onLoadButton; break;
            case (onLoadButton):     on = onCloseButton; break;
            }
        }
        
    if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("X")))
        {
        switch (on)
            {
            case (onSaveContButton):
                SaveGame(global.saveFile);
                visible = false;
                var _confirmation = instance_create(0, 0, objConfirmation);
                _confirmation.message = "Saved sucessfully!";
                _confirmation.useOkay = true;
                break;
            case (onSaveQuitButton):
                SaveGame(global.saveFile);
                var _confirmation = instance_create(0, 0, objConfirmation);
                _confirmation.message = "Saved sucessfully!";
                _confirmation.useOkay = true;
                _confirmation.exeYes = ConfirmSave;
                break;
            case (onLoadButton):
                var _confirmation = instance_create(0, 0, objConfirmation);
                _confirmation.message = "Are you sure you want to return to the load screen? Unsaved progress will be lost!";
                _confirmation.exeYes = ConfirmLoad;
                break;
            case (onCloseButton):    visible = false; break;
            }
        }
    }


