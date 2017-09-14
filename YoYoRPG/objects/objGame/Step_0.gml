
//-----------------------------------------------------------------------------
// Hotkey saving
if (keyboard_check_pressed(vk_f5))
    SaveGame(global.saveFile);

//-----------------------------------------------------------------------------
// Pausing

// Toggle
if ((keyboard_check_pressed(KEY_INVENTORY_OPEN))
|| (keyboard_check_pressed(vk_escape)))
&& (!instance_exists(objTransition))
&& (!instance_exists(objDialogueBox))
&& (objPlayer.life > 0)
    {
    if (!objInventory.visible)
    && (!objOptions.visible)
    && (!objSaveLoad.visible)
        {
        with (parPauseMenu) on = onTitle;
        with (objInventory) selection = 0;
            
        if (keyboard_check_pressed(KEY_INVENTORY_OPEN))
            objInventory.visible = true;
        if (keyboard_check_pressed(vk_escape))
            objSaveLoad.visible = true;
        }
    else with (parPauseMenu)
        visible = false;
    }

// Something else requires a force pause
forcePaused = (instance_exists(objTransition));
with (objInventory)    objGame.forcePaused |= visible;
with (objOptions)      objGame.forcePaused |= visible;
with (objSaveLoad)     objGame.forcePaused |= visible;
with (objConfirmation) objGame.forcePaused |= visible;

// User decides to pause
if (keyboard_check_pressed(KEY_PAUSE))
    userPaused ^= true;

// Actually pause
isPaused = (userPaused | forcePaused);

// Do animations
if (!isPaused)
    {
    AnimationAnimate(0);
    AnimationAnimate(1);
    AnimationAnimate(2);
    }


