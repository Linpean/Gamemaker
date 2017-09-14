with (objInventory) {
// Welcome to a long list of hacks!

if (visible)
    {
    // Darken the screen to emphisize focus
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1.0);
    
    // Work out position on screen (center)
    var _xPos, _yPos, _seperation, _icon;
    _seperation = 64+3;
    _halfSep = _seperation*0.5;
    _xPos = display_get_gui_width()*0.5-width*0.5;
    _yPos = display_get_gui_height()*0.5-height*0.5;
    
    // Draw Panel
    DrawPanel(_xPos, _yPos, width, height, true, true);
    
    // Draw panel selection
    DrawButton("Inventory", on==onTitle, _xPos+width*0.5,     _yPos);
    DrawButton("Save/Load", 0,           _xPos+width*0.5-206, _yPos);
    DrawButton("Options",   0,           _xPos+width*0.5+206, _yPos);
    
    // Draw headers
    draw_set_alpha(1.0);
    draw_sprite(sprHeaderBackpack, 0, _xPos+64,  _yPos+80);
    draw_sprite(sprHeaderInfo,     0, _xPos+439, _yPos+80);
    draw_sprite(sprHeaderEquipped, 0, _xPos+642, _yPos+80);
    
    // Draw gems
    draw_sprite(sprSaveSlotGem, 0, _xPos+80, _yPos+70);
    draw_set_halign(fa_left);
    draw_set_font(fntInformation);
    draw_set_color(c_black);
    draw_text(_xPos+80+10, _yPos+69, string_hash_to_newline(string(StringSepNumber(objPlayer.coins))));
    draw_set_color(c_white);
    draw_text(_xPos+80+10, _yPos+70, string_hash_to_newline(string(StringSepNumber(objPlayer.coins))));
    
    // Draw health
    for (var _heart=0; _heart<objPlayer.hearts; _heart++)
        draw_sprite(sprSaveSlotHeart, objPlayer.life<=_heart, _xPos+804-_heart*18, _yPos+70);
    
    // Draw the currently equipped items
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_sprite(sprEquipBox, 0, _xPos+642,    _yPos+128);
    draw_sprite(sprEquipBox, 0, _xPos+738, _yPos+128);
    
    // Draw weapon icon
    _icon = objPlayer.equippedWeapon[ITEM_ICON];
    if (_icon != -1) draw_sprite_stretched(_icon, 0, _xPos+647, _yPos+133, 64, 64);
    else             draw_sprite(sprEmptyWeapon,  0, _xPos+647, _yPos+133);
    
    // Draw armour icon
    if (is_array(objPlayer.equippedArmour))
        {
        _icon = objPlayer.equippedArmour[ITEM_ICON];
        if (_icon != -1) draw_sprite_stretched(_icon, 0, _xPos+743, _yPos+133, 64, 64);
        else             draw_sprite(sprEmptyArmour,  0, _xPos+743, _yPos+133);
        }
    else draw_sprite(sprEmptyArmour, 0, _xPos+743, _yPos+133);
        
    if (on != onTitle)
        {
        if (on == onWeapon) draw_sprite(sprEquipHighlight, 0, _xPos+128+171+343+5, _yPos+133);
        if (on == onArmour) draw_sprite(sprEquipHighlight, 0, _xPos+128+171+343+96+5, _yPos+133);
        }
    
    // Draw the array of slots
    var _x, _y, _drawX, _drawY, _gridPosition;
    draw_sprite(sprBackpackBox, 0, _xPos+64, _yPos+128);
    for (_y=0; _y<invHeight; _y++)
        {
        for (_x=0; _x<invWidth; _x++)
            {
            // Empty slot
            _drawX = _xPos+64+5+_x*_seperation;
            _drawY = _yPos+128+5+_y*_seperation;
            //draw_sprite(sprInventorySlot, 0, _drawX, _drawY);
            
            // Selection box
            _gridPosition = _y*invWidth + _x;
            if (selection == _gridPosition)
            && (on == onInventory)
                draw_sprite(sprEquipHighlight, 0, _drawX, _drawY);
            
            // Item icon
            _icon = ds_grid_get(slots, _gridPosition, ITEM_ICON);
            if (_icon != -1)
                draw_sprite_stretched(_icon, 0, _drawX, _drawY, 64, 64);
            
            // Draw item count
            _count = ds_grid_get(slots, _gridPosition, ITEM_COUNT);
            if (_count > 1)
                {
                draw_set_halign(fa_right);
                draw_text_transformed(_drawX+60, _drawY+54, string_hash_to_newline("x"+string(_count)), 0.75, 0.75, 0);
                }
            }
        }
        
    // Draw description of current item
    draw_sprite(sprEquipInfo, 0, _xPos+64+343+32, _yPos+128);
    
    var _name, _text;
    if (on == onWeapon)
        {
        _name = string(objPlayer.equippedWeapon[ITEM_NAME]);
        _text = string(objPlayer.equippedWeapon[ITEM_DESCRIPTION]);
        _icon = objPlayer.equippedWeapon[ITEM_ICON];
        }
    else if (on == onArmour)
        {
        if (is_array(objPlayer.equippedArmour))
            {
            _name = string(objPlayer.equippedArmour[ITEM_NAME]);
            _text = string(objPlayer.equippedArmour[ITEM_DESCRIPTION]);
            _icon = objPlayer.equippedArmour[ITEM_ICON];
            }
        else
            {
            _name = "No armour equipped!";
            _text = ""
            _icon = -1;
            }
        }
    else
        {
        _name = string(ds_grid_get(slots, selection, ITEM_NAME));
        _text = string(ds_grid_get(slots, selection, ITEM_DESCRIPTION));
        _icon = ds_grid_get(slots, selection, ITEM_ICON);
        }
    
    if (_name != "-1")
        {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_font(fntDialogue);
        draw_text_ext(_xPos+447, _yPos+128+8, string_hash_to_newline(_name), -1, 155);
        draw_set_font(fntInformation);
        draw_text_ext(_xPos+447, _yPos+128+8+24, string_hash_to_newline(_text), -1, 155);
        draw_set_font(fntDialogue);
        draw_text_ext(_xPos+447, _yPos+128+8+80, string_hash_to_newline(""), -1, 155);
        
        if (_icon != -1)
            draw_sprite(_icon, 0, _xPos+64+343+32+5, _yPos+128+110);
        }
        
    // Draw the exit button
    DrawButton("Close", on==onCloseButton, _xPos+width*0.5, _yPos+height-48);
    }


}
