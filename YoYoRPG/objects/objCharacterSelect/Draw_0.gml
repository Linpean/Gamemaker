
draw_set_alpha(1.0);
draw_sprite_stretched(sprTitleSplash, 0, 0, 0, room_width, room_height);
draw_sprite_ext(sprTitleLogo, 0, window_get_width()/2, 100, 0.5, 0.5, 0, c_white, 1.0);


// Work out position on screen (center)
var _xPos, _yPos, _seperation, _icon;
_seperation = 48;
_halfSep = _seperation/2;
_xPos = display_get_gui_width()*0.5-width*0.5;
_yPos = display_get_gui_height()*0.5-height*0.5+96;


// Draw Panel
DrawPanel(_xPos, _yPos, width, height, false, false);
//DrawButton("PICK CHARACTER", 1, _xPos+width*0.5, _yPos);


// Draw character selection
draw_sprite_ext(sprCharacterSelect, global.character=="Girl", _xPos+width*0.5, _yPos+height*0.5-32, 1, 1, 0, c_white, 1.0);
/*
if (global.character == "Boy")
    draw_sprite(sprCharacterBoy,  0, _xPos+width*0.5-200, _yPos+height*0.5-32);
else
    draw_sprite_ext(sprCharacterBoy,  0, _xPos+width*0.5-200, _yPos+height*0.5-32, 1, 1, 0, c_white, 0.5);

if (global.character == "Girl")
    draw_sprite(sprCharacterGirl,  0, _xPos+width*0.5+200, _yPos+height*0.5-32);
else
    draw_sprite_ext(sprCharacterGirl,  0, _xPos+width*0.5+200, _yPos+height*0.5-32, 1, 1, 0, c_white, 0.5);
*/

// Back button
DrawButton("Back", on==onClose, _xPos+width*0.5, _yPos+height-48);


/* */
/*  */
