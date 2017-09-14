
if (visible)
    {
    // Toggle options on button press
    if (keyboard_check_pressed(ord("Z"))
    ||  keyboard_check_pressed(ord("X")))
        {
        switch (on)
            {
            case (onSound): global.enableAudio ^= true; break;
            case (onMusic): global.enableMusic ^= true; break;
            case (onCloseButton):
                if (room == rmOptions)
                    {
                    instance_destroy();
                    room_goto(rmTitle);
                    }
                else
                    {
                    visible = false;
                    }
                break;
            }
        
        // Save settings
        ini_open("yyrpg.ini");
        ini_write_real("settings", "audio", global.enableAudio);
        ini_write_real("settings", "music", global.enableMusic);
        ini_close();
        }
    
    if (keyboard_check_pressed(vk_left))
        {
        switch (on)
            {
            // Switch options of arrow keys
            case (onSound): global.enableAudio = false; break;
            case (onMusic): global.enableMusic = false; break;
            
            // Leave options for next screen
            case (onTitle):
                visible = false;
                objInventory.visible = true;
                break;
            }
        }
        
    if (keyboard_check_pressed(vk_right))
        {
        switch (on)
            {
            // Switch options of arrow keys
            case (onSound): global.enableAudio = true; break;
            case (onMusic): global.enableMusic = true; break;
            }
        }
    
    if (keyboard_check_pressed(vk_up))
        {
        switch (on)
            {
            case (onCloseButton): on = onMusic; break;
            case (onSound): if (room != rmOptions) on = onTitle; break;
            case (onMusic): on = onSound; break;
            }
        }
    
    if (keyboard_check_pressed(vk_down))
        {
        switch (on)
            {
            case (onTitle): on = onSound; break;
            case (onSound): on = onMusic; break;
            case (onMusic): on = onCloseButton; break;
            }
        }
    }


