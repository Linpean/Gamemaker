
draw_sprite_stretched(sprTitleSplash, 0, 0, 0, room_width, room_height);

// Work out position on screen (center)
var _xPos, _yPos, _icon;
_xPos = room_width*0.5-width*0.5;
_yPos = room_height*0.5-height*0.5;

// Draw Panel
DrawPanel(_xPos, _yPos, width, height, false, false);

// Header
draw_sprite(sprHeaderNewGame, 0, _xPos+width*0.5, _yPos+64);

var _loadFile, _n, _newSlot;
_y = _yPos-90;
for (_n=0; _n<3; _n++)
    {
    DrawButton(string(slotName[_n]), _n==selected, _xPos+width*0.5-167-103-32, _y+height*0.5);
    draw_sprite(sprSaveGameSlot, _n==selected, _xPos+width*0.5-167, _y+height*0.5-37);
    draw_set_color(c_white);
    draw_set_font(fntInformation);
    
    // Draw empty slot
    if (slotGems[_n] == -1)
        {
        draw_set_halign(fa_center);
        draw_text(_xPos+width*0.5+32, _y+height*0.5, string_hash_to_newline("Empty"));
        }
    
    // Draw slot with loaded file information
    else
        {
        // Draw avatar
        switch (slotCharacter[_n])
            {
            case ("Boy"): draw_sprite(sprAvatarPlayerBoy, 0, _xPos+width*0.5-163, _y+height*0.5-33); break;
            case ("Girl"): draw_sprite(sprAvatarPlayerGirl, 0, _xPos+width*0.5-163, _y+height*0.5-33); break;
            default: 
            }
        
        // Location
        draw_set_halign(fa_left);
        draw_text(_xPos+width*0.5-85, _y+height*0.5-20, string_hash_to_newline("Location:"));
        draw_set_halign(fa_right);
        draw_text(_xPos+width*0.5+158, _y+height*0.5-20, string_hash_to_newline(string(LocationName(slotLocation[_n]))));
        
        // Life/Hearts
        draw_set_halign(fa_left);
        draw_text(_xPos+width*0.5-85, _y+height*0.5, string_hash_to_newline("Health:"));
        for (_heart=0; _heart<slotHearts[_n]; _heart++)
            draw_sprite(sprSaveSlotHeart, slotLife[_n]<=_heart, _xPos+width*0.5+150-_heart*18, _y+height*0.5);
        
        // Gems
        draw_sprite(sprSaveSlotGem, 0, _xPos+width*0.5+150, _y+height*0.5+20);
        draw_set_halign(fa_left);
        draw_text(_xPos+width*0.5-85, _y+height*0.5+20, string_hash_to_newline("Gems:"));
        draw_set_halign(fa_right);
        draw_text(_xPos+width*0.5+130, _y+height*0.5+20, string_hash_to_newline(string(StringSepNumber(slotGems[_n]))));
        }
    
    _y += 80;
    }

// Back button
DrawButton("Back", _n==selected, _xPos+width*0.5, _yPos+height-48);


