
// If the game is paused, interrupt everything
if (objGame.isPaused)
    {
    image_index -= image_speed;
    exit;
    }

event_inherited();


// Handle collisions
if (canMove)
    MobileDoCollision(horiSpeed, vertSpeed, parObstacleFull);
    
    
//-----------------------------------------------------------------------------
// Simple AI
// This has to be after collision/movement code in order to pick up changes.
if (!wait)
    {
    switch (state)
        {
        case (STATE_IDLE):
            idleTimer--;
            if (idleTimer <= 0)
                state = STATE_TURN;
            break;
            
        case (STATE_TURN):
            if (canMove || canTurn)
                {
                if (irandom(1)) horiSpeed = choose(-2, 2);
                else            vertSpeed = choose(-2, 2);
                paces = irandom_range(40, 150);
                state = STATE_MOVE;
                }
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
            idleTimer = floor(random_range(1.5, 3)*room_speed);
            break;
        }
    }

// Waiting
else
    {
    state = STATE_STOP;
    horiSpeed = 0;
    vertSpeed = 0;
    }


//-----------------------------------------------------------------------------
// Sprite and animation management
if (vertSpeed < 0) face = NORTH;
if (vertSpeed > 0) face = SOUTH;
if (horiSpeed > 0) face = EAST;
if (horiSpeed < 0) face = WEST;

// Moving
if (horiSpeed!=0 || vertSpeed!=0)
    {
    SetSpriteFromFace(spriteWalkNorth, spriteWalkSouth, spriteWalkEast, spriteWalkWest);
    image_speed = 0.15;
    }
else
    {
    SetSpriteFromFace(spriteIdleNorth, spriteIdleSouth, spriteIdleEast, spriteIdleWest);
    image_speed = 0.05;
    }

// Depth sorting
depth = -y;


