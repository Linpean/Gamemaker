// Smoothly move sign down to centre of screen
y = lerp(y,room_height/2+100,0.1);

// Navigation
if (keyboard_check_pressed(vk_down))
    on = onClose;
    
if (keyboard_check_pressed(vk_up))
    on = onCharacters;

if (on == onCharacters)
    {
    if (keyboard_check_pressed(vk_left))
    or (keyboard_check_pressed(vk_right))
        {
        PlaySound(snd_Select);
        if (global.character == "Boy")
            global.character = "Girl";
        else
            global.character = "Boy";
        }
    }

if (keyboard_check_pressed(ord("Z"))
||  keyboard_check_pressed(ord("X")))
    {
    if (on == onCharacters)
        {
        PlaySound(snd_Select);
        characterSelect = false;
        startTimer = 1*room_speed;
        }
    else
        {
        room_goto(rmSlotSelect);
        }
    }

// Select and continue to game
else if (startTimer-- == 0)
    {
    PlaySound(snd_Positive);
    NewGame();
    }

if (keyboard_check_pressed(vk_backspace))
    {
    PlaySound(snd_Select);
    //characterSelect = true;
    }



