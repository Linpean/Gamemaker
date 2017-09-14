
// Navigation
if (!useOkay)
    {
    if (keyboard_check_pressed(vk_right)) on = onNo;
    if (keyboard_check_pressed(vk_left))  on = onYes;
    }

// Select
if (keyboard_check_pressed(ord("Z")))
|| (keyboard_check_pressed(ord("X")))
    {
    switch (on)
        {
        case (onYes):
            if (exeYes != -1) script_execute(exeYes);
            else              instance_destroy();
            break;
            
        case (onNo):
            if (exeNo != -1) script_execute(exeNo);
            else             instance_destroy();
            break;
        }
    }

