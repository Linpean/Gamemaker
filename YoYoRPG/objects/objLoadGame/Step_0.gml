
selected -= keyboard_check_pressed(vk_up)   && selected>0;
selected += keyboard_check_pressed(vk_down) && selected<4;

if (keyboard_check_pressed(ord("Z")))
|| (keyboard_check_pressed(ord("X")))
    {
    if (selected == 4)
        {
        room_goto(rmTitle);
        }
    else
        {
        if (file_exists(slotFile[selected]))
            {
            global.loadGame = true;
            global.autoFile = "yyrpg_auto.ini";
            global.saveFile = slotFile[selected];
            global.loadFile = slotFile[selected];
            LoadGame();
            }
        }
    }


