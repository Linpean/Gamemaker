
if (visible)
    {
    if (room == rmOptions)
        {
        draw_set_alpha(1.0);
        draw_sprite_stretched(sprTitleSplash, 0, 0, 0, room_width, room_height);
        }
    else
        {
        // Darken the screen to emphisize focus
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
        }
    
    // Work out position on screen (center)
    var _xPos, _yPos, _seperation, _icon;
    _seperation = 48;
    _halfSep = _seperation/2;
    _xPos = display_get_gui_width()*0.5-width*0.5;
    _yPos = display_get_gui_height()*0.5-height*0.5;
    
    // Draw panel
    DrawPanel(_xPos, _yPos, width, height, true, room!=rmOptions);
    
    // Draw panel selection
    if (room == rmOptions)
        {
        // Header
        draw_sprite(sprHeaderOptions, 0, _xPos+width*0.5, _yPos+64);
        }
    else
        {
        // Header
        draw_sprite(sprHeaderOptions, 0, _xPos+width*0.5, _yPos+80);
        DrawButton("Inventory", 0,           _xPos+width*0.5,     _yPos);
        DrawButton("Save/Load", 0,           _xPos+width*0.5-206, _yPos);
        DrawButton("Options",   on==onTitle, _xPos+width*0.5+206, _yPos);
        }
    
    // Draw options
    DrawButton("Sound", on==onSound, _xPos+width*0.5-103, _yPos+height*0.5-40);
    draw_set_alpha(1.0);
    draw_sprite(sprToggleCross, !global.enableAudio, _xPos+width*0.5-103+127+37, _yPos+height*0.5-40);
    draw_sprite(sprToggleTick, global.enableAudio, _xPos+width*0.5-103+127+74+24+37, _yPos+height*0.5-40);
    
    DrawButton("Music", on==onMusic, _xPos+width*0.5-103, _yPos+height*0.5+40);
    draw_set_alpha(1.0);
    draw_sprite(sprToggleCross, !global.enableMusic, _xPos+width*0.5-103+127+37, _yPos+height*0.5+40);
    draw_sprite(sprToggleTick, global.enableMusic, _xPos+width*0.5-103+127+74+24+37, _yPos+height*0.5+40);
    
    // Draw the exit button
    DrawButton("Close", on==onCloseButton, _xPos+width*0.5, _yPos+height-48);
    }


