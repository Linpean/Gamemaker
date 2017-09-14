
event_inherited();

// Handle collisions
if (canMove)
    MobileDoCollision(horiSpeed, vertSpeed, parObstacleFull);

// Player in range
if (instance_exists(objPlayerCharacter))
and (!instance_exists(objDialogueBox))
    {
    if (point_distance(x, y, objPlayerCharacter.x, objPlayerCharacter.y) < 128)
    && (state != STATE_ATTACK)
    && (state != STATE_STAGGER)
        state = STATE_CHASE;
    
    // Player is not in range
    else if (state == STATE_CHASE)
        state = STATE_IDLE;
    }
else if (state == STATE_CHASE)
     || (state == STATE_ATTACK)
    state = STATE_IDLE;


