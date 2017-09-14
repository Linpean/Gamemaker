
if (state == "Tap")
    {
    var _xPos = room_width/2;
    var _yPos = room_height-64;
    
    draw_set_alpha(1.0);
    draw_sprite_stretched(sprTitleSplash, 0, 0, 0, room_width, room_height);
    draw_sprite_ext(sprTitleLogo, 0, _xPos, 100, 0.5, 0.5, 0, c_white, titleFade);
    
    show++;
    if (show > 30)
        show = -30;
        
    if (show > 0)
        draw_sprite(sprPressToStart, 0, _xPos, _yPos);
    }
    
else
    {
    var _xCenter = room_width/2;
    var _yCenter = room_height/2;
    
    draw_set_alpha(1.0);
    draw_sprite_stretched(sprTitleSplash, 0, 0, 0, room_width, room_height);
    draw_sprite_ext(sprTitleLogo, 0, _xCenter, 100, 0.5, 0.5, 0, c_white, titleFade);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fntNotification);
    draw_set_alpha(titleFade);
    
    // Draw panel
    DrawPanel(_xCenter-192, _yCenter-64, 384, 256+64, false, false);
    
    // Draw buttons
    DrawButton("NEW GAME", buttonSelected==0, _xCenter, _yCenter+64*0);
    DrawButton("LOAD",     buttonSelected==1, _xCenter, _yCenter+64*1);
    DrawButton("OPTIONS",  buttonSelected==2, _xCenter, _yCenter+64*2);
    DrawButton("EXIT",     buttonSelected==3, _xCenter, _yCenter+64*3);
    }


