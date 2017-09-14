
if (state == "Tap")
    {
    // Fade in title
    if (titleFade < 1.0)
        titleFade += 1.0/room_speed;
        
    // Continue on tap
    if (keyboard_check_pressed(ord("X")))
    || (keyboard_check_pressed(ord("Z")))
        state = "Menu";
    }
    
else
    {
    // Fade in title
    //if (titleFade < 1.0)
        //titleFade += 1.0/room_speed;
    
    // Navigation
    if (keyboard_check_pressed(vk_down)) {buttonSelected++; PlaySound(snd_Select);}
    if (keyboard_check_pressed(vk_up))   {buttonSelected--; PlaySound(snd_Select);}
    if (buttonSelected > 3) {buttonSelected = 0;}
    if (buttonSelected < 0) {buttonSelected = 3;}
    
    // Select current button
    if (keyboard_check_pressed(ord("Z"))
    ||  keyboard_check_pressed(ord("X")))
        {
        switch (buttonSelected)
            {
            case (0): PlaySound(snd_Positive); room_goto_next(); break;
            case (1): PlaySound(snd_Positive); room_goto(rmLoadGame); break;
            case (2): room_goto(rmOptions); break;
            case (3): PlaySound(snd_Negative); game_end(); break;
            }
        }
    }


