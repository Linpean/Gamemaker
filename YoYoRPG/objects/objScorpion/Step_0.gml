
// If the game is paused, interrupt everything
if (objGame.isPaused)
    {
    image_index -= image_speed;
    exit;
    }

event_inherited();
    
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
        
    case (STATE_CHASE):
        var _direction;
        _direction = point_direction(x, y, objPlayerCharacter.x, objPlayerCharacter.y);
        _direction = floor(_direction/45)*45;
        horiSpeed = lengthdir_x(3, _direction);
        vertSpeed = lengthdir_y(3, _direction);
        if (point_distance(x, y, objPlayerCharacter.x, objPlayerCharacter.y) < 34)
            {
            state = STATE_ATTACK;
            stateSwitched = true;
            }
        break;
        
    case (STATE_ATTACK):
        // Starting Attack
        if (stateSwitched)
            {
            stateSwitched = false;
            horiSpeed = 0;
            vertSpeed = 0;
            SetSpriteFromFace(spriteAttackNorth, spriteAttackSouth, spriteAttackEast, spriteAttackWest);
            image_index = 0;
            
            if (instance_exists(objPlayerCharacter))
                {
                if (!objPlayerCharacter.beenHit)
                    {
                    PlaySound(snd_GetHit);
                    objPlayer.life--;
                    objPlayerCharacter.beenHit = true;
                    objPlayerCharacter.staggerTimer = 0.5*room_speed;
                    objPlayerCharacter.face = GetOppositeDirection(face);
                    show_debug_message("Hit by enemy: "+string(object_get_name(object_index)));
                    }
                }
            }
        
        // Ending Attack
        if (round(image_index) >= image_number)
            state = STATE_IDLE;
        break;
        
    case (STATE_STOP):
        horiSpeed = 0;
        vertSpeed = 0;
        state = STATE_IDLE;
        idleTimer = 1*room_speed;
        break;
        
    case (STATE_STAGGER):
        staggerTimer--;
        if (staggerTimer <= 0)
            {
            state = STATE_IDLE;
            beenHit = false;
            }
            
        // Do stagger
        vertSpeed = 0;
        horiSpeed = 0;
        switch (face)
            {
            case (NORTH): vertSpeed = staggerTimer/5; break;
            case (SOUTH): vertSpeed = -staggerTimer/5; break;
            case (EAST):  horiSpeed = -staggerTimer/5; break;
            case (WEST):  horiSpeed = staggerTimer/5; break;
            }
        break;
    }


//-----------------------------------------------------------------------------
// Sprite and animation management
if (beenHit)
    {
    image_speed = 0.4;
    SetSpriteFromFace(spriteStaggerNorth, spriteStaggerSouth, spriteStaggerEast, spriteStaggerWest);
    }
    
else if (state != STATE_ATTACK)
&&      (state != STATE_STAGGER)
    {
    // Walking
    if      (vertSpeed < 0) {face = NORTH;}
    else if (vertSpeed > 0) {face = SOUTH;}
    else if (horiSpeed > 0) {face = EAST;}
    else if (horiSpeed < 0) {face = WEST;}
    SetSpriteFromFace(spriteWalkNorth, spriteWalkSouth, spriteWalkEast, spriteWalkWest);
    
    // Idle
    if (vertSpeed==0 && horiSpeed==0)
        SetSpriteFromFace(spriteIdleNorth, spriteIdleSouth, spriteIdleEast, spriteIdleWest);
    }

if (x != xprevious)
|| (y != yprevious)
    image_speed = 0.15;
else
    image_speed = 0.1;
    
depth = -y;


