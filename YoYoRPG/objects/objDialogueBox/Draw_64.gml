
var _x, _y, _width, _height;
_width = 512;
_height = 96;
_x = display_get_gui_width()/2-_width/2;
_y = display_get_gui_height()-_height-64;

//-----------------------------------------------------------------------------
// Draw the avatar and name
draw_set_color($7FEFD9);    // BGR
draw_set_font(fntHud);
draw_set_halign(fa_left);
draw_sprite(sprDialogueBox, 0, _x, _y);

// Waiting for user response, show player
if (waitForResponse)
    {
    if (avatarSprite != -1) draw_sprite(objPlayerCharacter.avatarSprite, 0, _x+1, _y+1);
    if (name != "") draw_text(_x+64, _y+24, string_hash_to_newline("You:"));
    }

// NPC is talking, show avatar and name
else
    {
    if (avatarSprite != -1) draw_sprite(avatarSprite, 0, _x+1, _y+1);
    if (name != "") draw_text(_x+64, _y+24, string_hash_to_newline(name+":"));
    }

// If there is no name, make sure text is drawn higher so it doesn't seem uncentered.
_y -= 16 * (name == "");


//-----------------------------------------------------------------------------
// Setup surface, and draw all the stuff to it
if (!surface_exists(textSurface))
    textSurface = surface_create(512, 96);
surface_set_target(textSurface);
draw_clear_alpha($000000, 0.0);

// General text settings
draw_set_alpha(1.0);
draw_set_halign(fa_left);
draw_set_valign(alignment);
draw_set_color(c_white);
draw_set_font(fntDialogue);

// Set position that text should start drawing according to alignment
switch (alignment)
    {
    case (Alignment.top)    : _textY = 8; break;
    case (Alignment.middle) : _textY = _height/2; break;
    case (Alignment.bottom) : _textY = _height-8; break;
    default                 : _textY = 0; break;
    }

// We just bought an item, show this information
var _text;
if (showPurchasedDialogue)
    {
    _text = "You've purchased "+string(purchasedItem[ITEM_COUNT])+" "+purchasedItem[ITEM_NAME];
    _text += "#- "+purchasedItem[ITEM_DESCRIPTION];
    draw_text_ext(64, _textY, string_hash_to_newline(_text), -1, _width-128);
    }
        
// Draw the player's potential responses
else if (waitForResponse)
    {
    var _textHeight, _runningHeight, _itemArray, _itemLimit, _addHeight;
    
    // Get the height of all the strings we need to display
    _runningHeight = 0;
    for (_index=0; _index<numberOfResponses; _index++)
        {
        _text = "";
        _addHeight = 0;
        if (type[section, _index] == 0)
        || (type[section, _index] == 2)
        || (type[section, _index] == 3)
            {
            _text = response[section, _index];
            _addHeight = string_height_ext(string_hash_to_newline(_text), -1, _width-128)/2+4;
            }
        else
            {
            _itemArray = script_execute(response[section, _index]);
            _itemLimit = -outcome[section, _index];
            
            // If there is no item limit, or we are below that limit
            if (!_itemLimit)
            || (InventoryFindNumberItem(_itemArray) < _itemLimit)
                {
                _text = _itemArray[ITEM_NAME];
                _addHeight = string_height_ext(string_hash_to_newline(_text), -1, _width-128)/2+4;
                }
            }
        _runningHeight += _addHeight;
        _textHeight[_index] = _runningHeight;
        _runningHeight += _addHeight;
        }
    
    // Draw items
    draw_set_valign(fa_middle);
    for (_index=0; _index<numberOfResponses; _index++)
        {
        draw_set_color(merge_colour(c_gray, c_white, selectedResponse==_index));
        selectionY = lerp(selectionY, _textHeight[selectedResponse], 0.1);
        
        // This is a simple text response
        if (type[section, _index] == 0)
        || (type[section, _index] == 2)
        || (type[section, _index] == 3)
            {
            _text = response[section, _index];
            draw_text_ext(64, _height/2+_textHeight[_index]-selectionY, string_hash_to_newline(_text), -1, _width-128);
            }
        
        // This is an item for sale
        else
            {
            _itemArray = script_execute(response[section, _index]);
            _itemLimit = -outcome[section, _index];
            if (!_itemLimit)
            || (InventoryFindNumberItem(_itemArray) < _itemLimit)
                {
                _text = _itemArray[ITEM_NAME];
                _number = abs(outcome[section, _index]);
                _icon = _itemArray[ITEM_ICON];
                draw_sprite_stretched(_icon, 0, 8+64, _height/2+_textHeight[_index]-selectionY-16, 32, 32);
                draw_text_transformed(40+64, _height/2+_textHeight[_index]-selectionY, string_hash_to_newline("x"+string(_number)), 0.75, 0.75, 0);
                
                // Draw cost
                var _color;
                draw_set_halign(fa_right);
                if (objPlayer.coins < _itemArray[ITEM_VALUE]*_number) _color = c_red;
                else                                                  _color = c_lime;
                _cost = abs(_itemArray[ITEM_VALUE]*_number);
                draw_text_transformed_color(86+64+8, _height/2+_textHeight[_index]-selectionY, string_hash_to_newline(string(_cost)+"x"), 0.75, 0.75, 0, _color, _color, _color, _color, 1);
                draw_sprite_ext(sprGreenGem, 0, 96+64+8, _height/2+_textHeight[_index]-selectionY+12, 0.75, 0.75, 0, c_white, 1.0);
                
                draw_set_halign(fa_left);
                draw_text_ext(128+64, _height/2+_textHeight[_index]-selectionY, string_hash_to_newline(_text), -1, _width-128);
                }
            }
        }
    }
    
// Draw the NPC text
else
    {
    draw_set_valign(alignment);
    _text = text[section, sentence];
    draw_text_ext(64, _textY, string_hash_to_newline(_text), -1, _width-128);
    }

surface_reset_target();


// Draw selection arrow (to indicate that user can move up and/or down)
if (waitForResponse && numberOfResponses>1)
    {
    if (selectedResponse > 0) draw_sprite_ext(sprDialogueArrow, 0, _x+_width-64, _y+64-16, 1, -1, 0, c_white, 1.0);
    if (selectedResponse < numberOfResponses-1) draw_sprite(sprDialogueArrow, 0, _x+_width-64, _y+64+16);
    }


//-----------------------------------------------------------------------------
// Draw the surface onto a primitive, so we can fade out the top and bottom edges
draw_primitive_begin_texture(pr_trianglestrip, surface_get_texture(textSurface));
draw_vertex_texture_colour(_x,        _y+32,            0.0, 0.0,   $FFFFFF, 0.0);
draw_vertex_texture_colour(_x+_width, _y+32,            1.0, 0.0,   $FFFFFF, 0.0);
draw_vertex_texture_colour(_x,        _y+32+16,         0.0, 16/96, $FFFFFF, 1.0);
draw_vertex_texture_colour(_x+_width, _y+32+16,         1.0, 16/96, $FFFFFF, 1.0);
draw_vertex_texture_colour(_x,        _y+32+_height-16, 0.0, 80/96, $FFFFFF, 1.0);
draw_vertex_texture_colour(_x+_width, _y+32+_height-16, 1.0, 80/96, $FFFFFF, 1.0);
draw_vertex_texture_colour(_x,        _y+32+_height,    0.0, 1.0,   $FFFFFF, 0.0);
draw_vertex_texture_colour(_x+_width, _y+32+_height,    1.0, 1.0,   $FFFFFF, 0.0);
draw_primitive_end();

// Reset drawing settings
draw_set_alpha(1.0);
draw_set_color(c_white);


