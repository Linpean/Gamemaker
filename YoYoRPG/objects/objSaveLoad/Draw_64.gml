
if (visible)
    {
    // Darken the screen to emphisize focus
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    // Work out position on screen (center)
    var _xPos, _yPos, _seperation, _icon;
    _seperation = 48;
    _halfSep = _seperation/2;
    _xPos = display_get_gui_width()*0.5-width*0.5;
    _yPos = display_get_gui_height()*0.5-height*0.5;
    
    // Draw Panel
    DrawPanel(_xPos, _yPos, width, height, true, true);
    
    // Draw panel selection
    DrawButton("Inventory", 0,           _xPos+width*0.5,     _yPos);
    DrawButton("Save/Load", on==onTitle, _xPos+width*0.5-206, _yPos);
    DrawButton("Options",   0,           _xPos+width*0.5+206, _yPos);
    
    // Buttons
    DrawButtonLong("Save and Continue", on==onSaveContButton, _xPos+width*0.5, _yPos+height*0.5-80);
    DrawButtonLong("Save and Quit",     on==onSaveQuitButton, _xPos+width*0.5, _yPos+height*0.5);
    DrawButtonLong("Load",            on==onLoadButton,     _xPos+width*0.5, _yPos+height*0.5+80);
    
    // Draw the exit button
    DrawButton("Close", on==onCloseButton, _xPos+width*0.5, _yPos+height-48);
    }


