
// If the game is paused, interrupt everything
if (objGame.isPaused)
    {
    image_index -= image_speed;
    exit;
    }


// Spawn items around the chest
if (dropTimer-- == 0) && (dropNumber > 0)
    {
    var _x, _y, _newItem;
    _x = x+16+lengthdir_x(32, dropDirection);
    _y = y+16+lengthdir_y(32, dropDirection);
    _newItem = instance_create(x+16, y+16, objNewObject);
    _newItem.object = item[ITEM_OBJECT];
    _newItem.destX = _x;
    _newItem.destY = _y;
    _newItem.placed = false;
    
    // Setup to spawn next item
    dropTimer = 10;
    dropNumber--;
    dropDirection += 360/item[ITEM_COUNT];
    }


