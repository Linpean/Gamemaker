
if (instance_exists(objConfirmation))
    exit;

selected -= keyboard_check_pressed(vk_up)   && selected>0;
selected += keyboard_check_pressed(vk_down) && selected<3;

if (keyboard_check_pressed(ord("Z")))
|| (keyboard_check_pressed(ord("X")))
    {
    if (selected == 3)
        {
        room_goto(rmTitle);
        }
    else
        {
        global.saveFile = slotFile[selected];
        if (file_exists(global.saveFile))
            {
            var _confirmation = instance_create(0, 0, objConfirmation);
            _confirmation.message = "Are you sure you want to overwrite this save game?";
            _confirmation.exeYes = ConfirmSlot;
            }
        else
            {
            ConfirmSlot();
            }
        }
    }


