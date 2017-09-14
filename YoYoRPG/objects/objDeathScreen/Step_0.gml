
if (visible)
    {
    // Toggle options on button press
    if (keyboard_check_pressed(ord("Z"))
    ||  keyboard_check_pressed(ord("X")))
        {
        switch (on)
            {
            case (onContButton): EndGame(); global.loadFile = global.lastSaveGame; LoadGame(); break;
            case (onQuitButton): EndGame(); room_goto(rmTitle); break;
            case (onLoadButton): EndGame(); room_goto(rmLoadGame); break;
            }
        }
    
    if (keyboard_check_pressed(vk_up))
        {
        switch (on)
            {
            case (onLoadButton): on = onQuitButton; break;
            case (onQuitButton): on = onContButton; break;
            }
        }
    
    if (keyboard_check_pressed(vk_down))
        {
        switch (on)
            {
            case (onContButton): on = onQuitButton; break;
            case (onQuitButton): on = onLoadButton; break;
            }
        }
    }
    

