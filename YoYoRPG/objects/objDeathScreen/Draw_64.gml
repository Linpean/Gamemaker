
if (visible)
    {
    // Darken the screen to emphisize focus
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    // Work out position on screen (center)
    var _xPos, _yPos;
    _xPos = display_get_gui_width()*0.5-width*0.5;
    _yPos = display_get_gui_height()*0.5-height*0.5;
    
    // Draw Panel
    DrawPanel(_xPos, _yPos, width, height, false, false);
    
    // Header
    draw_sprite(sprHeaderYouDied, 0, _xPos+width*0.5, _yPos+64);
    
    // Buttons
    DrawButtonLong("CONTINUE FROM LAST SAVE", on==onContButton, _xPos+width*0.5, _yPos+height*0.5-80);
    DrawButtonLong("QUIT TO MAIN MENU",       on==onQuitButton, _xPos+width*0.5, _yPos+height*0.5);
    DrawButtonLong("LOAD GAME",               on==onLoadButton, _xPos+width*0.5, _yPos+height*0.5+80);
    }


