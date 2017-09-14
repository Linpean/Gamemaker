
// If the game is paused, interrupt everything
if (instance_exists(objGame))
{
    if (objGame.isPaused)
        {
        image_index -= image_speed;
        exit;
        }
}

event_inherited();


// Handle collisions
if (canMove)
    MobileDoCollision(horiSpeed, vertSpeed, parObstacleFull);
    
    
//-----------------------------------------------------------------------------
// Simple AI
// This has to be after collision/movement code in order to pick up changes.
switch (state)
    {
    case (STATE_IDLE):
        idleTimer--;
        if (idleTimer <= 0)
            state = STATE_TURN;
        break;
        
    case (STATE_TURN):
        if (irandom(1))
            horiSpeed = choose(-3, 3);
        else
            vertSpeed = choose(-3, 3);
        paces = irandom_range(50, 200);
        state = STATE_MOVE; 
        break;
        
    case (STATE_MOVE):
        paces--;
        if (x == xprevious)
        && (y == yprevious)
        || (paces <= 0)
            state = STATE_STOP;
        break;
        
    case (STATE_STOP):
        horiSpeed = 0;
        vertSpeed = 0;
        state = STATE_IDLE;
        idleTimer = 1*room_speed;
        break;
        
    case (STATE_STAGGER):
        staggerTimer--;
        image_blend = merge_color(c_white, c_red, lengthdir_x(1, staggerTimer*15));
        if (staggerTimer <= 0)
            {
            image_blend = c_white;
            state = STATE_IDLE;
            beenHit = false;
            if (myLife <= 0)
                hide = true;
            }
            
        // Do stagger
        switch (face)
            {
            case (NORTH): vertSpeed = staggerTimer/5; break;
            case (SOUTH): vertSpeed = staggerTimer/5; break;
            case (EAST):  horiSpeed = staggerTimer/5; break;
            case (WEST):  horiSpeed = staggerTimer/5; break;
            }
        break;
    }


//-----------------------------------------------------------------------------
// Sprite and animation management
if (vertSpeed < 0) face = NORTH;
if (vertSpeed > 0) face = SOUTH;
if (horiSpeed > 0) face = EAST;
if (horiSpeed < 0) face = WEST;
SetSpriteFromFace(sprChickenWalkNorth, sprChickenWalkSouth, sprChickenWalkEast, sprChickenWalkWest);

if (x != xprevious)
|| (y != yprevious)
    image_speed = 0.15;
else
    image_index = 0;
    
depth = -y;


