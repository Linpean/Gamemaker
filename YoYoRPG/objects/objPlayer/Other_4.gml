
// Make sure player exists!
if (!instance_exists(objPlayerCharacter))
    instance_create(0, 0, objPlayerCharacter);


// Move to outside the requested door
if (global.spawnDoor != -1)
    {
    // Get x position for the center of the door
    var sprite, offset, xoff;
    sprite = global.spawnDoor.sprite_index;
    xoff = sprite_get_xoffset(sprite);
    offset = (sprite_get_width(sprite)-xoff) / 2;
    
    // A blank door implies we are coming in from the south
    if (global.spawnDoor.object_index == objBlank)
        {
        objPlayerCharacter.x = global.spawnDoor.x+offset;
        objPlayerCharacter.y = global.spawnDoor.y-4;
        objPlayerCharacter.face = NORTH;
        }
    // Otherwise, we are coming in from the north
    else
        {
        objPlayerCharacter.x = global.spawnDoor.x+offset;
        objPlayerCharacter.y = global.spawnDoor.y+64;
        objPlayerCharacter.face = SOUTH;
        }
    // Disable player input until they press something again
    objPlayerCharacter.controlsAble = false;
    }


// Activate all "hidden" objects
instance_activate_object(objGrass);
instance_activate_object(objPot);
instance_activate_object(parMortal);

// Reset spawn door and player character variables
global.spawnDoor = -1;
with (objPlayerCharacter)
    {
    beenHit = false;         // Wether the character has been hit.
    staggerTimer = 0;        // Timer for when hit, (flashing, no-damage, no-input, etc)
    attacking = false;       // Currently performing an attack
    
    SetSpriteFromFace(spriteIdleNorth, spriteIdleSouth, spriteIdleEast, spriteIdleWest);
    
    // Put view in the new location
    __view_set( e__VW.XView, 0, floor(median(0, room_width-__view_get( e__VW.WView, 0 ),  x-__view_get( e__VW.WView, 0 )/2 )));
    __view_set( e__VW.YView, 0, floor(median(0, room_height-__view_get( e__VW.HView, 0 ), y-__view_get( e__VW.HView, 0 )/2 )));
    }


