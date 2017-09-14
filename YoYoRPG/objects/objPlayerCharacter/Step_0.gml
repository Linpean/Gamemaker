//-----------------------------------------------------------------------------
// General states

// If the game is paused, interrupt everything
if (objGame.isPaused)
    {
    image_index -= image_speed;
    exit;
    }

// Movement interrupt
canMove = !attacking
       && !charging
       && !instance_exists(objDialogueBox);
       
// Allow movement but disable input in certain cases
if (staggerTimer > 0)
    controlsAble = false;

// Restore controls on new keypress (ex; after moving through door)
else if (!controlsAble)
    {
    var newKey;
    newKey = keyboard_check_pressed(KEY_ACTION)
          || keyboard_check_pressed(KEY_ATTACK)
          || keyboard_check_direct(KEY_UP)
          || keyboard_check_direct(KEY_DOWN)
          || keyboard_check_direct(KEY_LEFT)
          || keyboard_check_direct(KEY_RIGHT);
    if (newKey)
        controlsAble = true;
    }


//-----------------------------------------------------------------------------
// Attacking
if (controlsAble)
    {
    var _pressed, _held;
    _pressed = keyboard_check_pressed(KEY_ATTACK);
    _released = keyboard_check_released(KEY_ATTACK);
    _held = keyboard_check(KEY_ATTACK);
    if (_pressed)
    && (canMove)
        {
        // Flag that we are attacking, and set for how long
        attacking = true;
        spins = 1;
        SetSpriteFromFace(spriteAttackNorth, spriteAttackSouth, spriteAttackEast, spriteAttackWest);
        image_index = 0;
        image_speed = 0.4;
        canMove = false;
        charge = 0;
        charging = false;
        
        // Create collision mask for the attack
        var _newStrikeMask;
        _newStrikeMask = instance_create(x, y, objPlayerStrike);
        _newStrikeMask.face = face;
        _newStrikeMask.spins = spins;
        _newStrikeMask.depth = depth;
        _newStrikeMask.image_speed = image_speed;
        with (_newStrikeMask)
            {
            var _weapon;
            _weapon = script_execute(objPlayer.equippedWeapon[ITEM_SPRITESET]);
            SetSpriteFromFace(_weapon);
            }
        }
        
    if (_held) && (_pressed || charging)
        {
        charging = true;
        //show_debug_message("Charging: "+string(charge));
        if (charge++ >= 45)
            {
            attacking = true;
            spins = 2;
            sprite_index = sprBoyAttackSpecial;
            image_speed = 0.25;
            
            var _newStrikeMask;
            _newStrikeMask = instance_create(x, y, objPlayerStrike);
            _newStrikeMask.face = face;
            _newStrikeMask.spins = spins;
            _newStrikeMask.depth = depth;
            _newStrikeMask.image_speed = image_speed;
            _newStrikeMask.sprite_index = sprBoyAttackSpecial;
            _newStrikeMask.visible = false;
            _newStrikeMask.bonusDamage = 1;
            
            charging = false;
            }
        }
        
    // If we were charging, but have released
    else if (_released) && (charging)
        {
        charging = false;
        charge = 0;
        }
    }


//-----------------------------------------------------------------------------
// Action
_pressed = keyboard_check_pressed(KEY_ACTION) && controlsAble;
if (_pressed)
&& (canMove)
    {
    // Find item we are looking at depending on direction
    var foundInst;
    foundInst = GetInstanceFromFace(parInteract);
    if (foundInst != noone)
        {
        switch (foundInst.object_index)
            {
            case (objChest):
                foundInst.image_speed = 0.1;
                break;
            case (objSign):
                ShowDialogue(foundInst);
                break;
            }
        }
        
    // Didn't find item. Try and find NPC.
    else
        {
        foundInst = GetInstanceFromFace(parNpc);
        if (foundInst != noone)
            {
            ShowDialogue(foundInst);
            foundInst.face = GetOppositeDirection(face);
            foundInst.wait = true;
            }
        }
    }


//-----------------------------------------------------------------------------
// Get input
var h_spd, v_spd;
h_spd = 0;
v_spd = 0;
if (canMove)
&& (controlsAble)
    {
    h_spd +=(keyboard_check(KEY_RIGHT)-keyboard_check(KEY_LEFT)) * mySpeed;
    v_spd +=(keyboard_check(KEY_DOWN)-keyboard_check(KEY_UP)) * mySpeed;
    if (keyboard_check(KEY_UP))    {face = NORTH;}
    if (keyboard_check(KEY_DOWN))  {face = SOUTH;}
    if (keyboard_check(KEY_RIGHT)) {face = EAST;}
    if (keyboard_check(KEY_LEFT))  {face = WEST;}
    }
    

//-----------------------------------------------------------------------------
// Death
if (instance_exists(objPlayer))
    {
    if (objPlayer.life <= 0)
        {
        PlaySound(snd_Death);
        objPlayer.alarm[0] = room_speed*2;
        
        var _n, _x, _y;
        for (_n=0; _n<sprite_get_number(spriteDeathBits); _n++)
            {
            _x = x+lengthdir_x(16+random(32), random(360));
            _y = y+lengthdir_y(16+random(32), random(360));
            _newItem = instance_create(x, y, objNewObject);
            _newItem.sprite_index = spriteDeathBits;
            _newItem.image_index = _n;
            _newItem.destX = _x;
            _newItem.destY = _y;
            _newItem.despawn = false;
            }
        
        instance_destroy();
        }
    }


//-----------------------------------------------------------------------------
// Stagger. + Recover from stagger.
// When hit by an enemy, the character staggers, here we return to normal.
if (staggerTimer > 0)
    {
    // Recovery
    staggerTimer--;
    if (staggerTimer == 0)
        beenHit = false;
        
    // Do stagger
    switch (face)
        {
        case (NORTH): v_spd += staggerTimer/5; break;
        case (SOUTH): v_spd -= staggerTimer/5; break;
        case (EAST):  h_spd -= staggerTimer/5; break;
        case (WEST):  h_spd += staggerTimer/5; break;
        }
    }


//-----------------------------------------------------------------------------
// Hit by enemy.
var _enemy;
_enemy = instance_place(x+h_spd, y+v_spd, parEnemy);
if (_enemy != noone)
    {
    // If not already hit, take damage and stagger
    if (!beenHit)
        {
        objPlayer.life--;
        beenHit = true;
        staggerTimer = 0.5*room_speed;
        show_debug_message("Hit by enemy: "+string(object_get_name(_enemy.object_index)));
        }
    }


//-----------------------------------------------------------------------------
// Handle collisions and movement
// Remember, because we handle collisions here, instances of parObstacle won't trigger collision events
if (canMove)
    MobileDoCollision(h_spd, v_spd, parObstacle);


//-----------------------------------------------------------------------------
// Sprite and animation management (Idle and movement, see above for attacking)

// Set default animation speed if not attacking
if (!attacking)
    {
    if (beenHit)
        {
        image_speed = 0.4;
        SetSpriteFromFace(spriteStaggerNorth, spriteStaggerSouth, spriteStaggerEast, spriteStaggerWest);
        }

    // Moving
    else if (h_spd!=0 || v_spd!=0)
        {
        image_speed = 0.15;
        SetSpriteFromFace(spriteWalkNorth, spriteWalkSouth, spriteWalkEast, spriteWalkWest);
        }
    
    // Idle
    else if (!attacking)
        {
        image_speed = 0.05;
        SetSpriteFromFace(spriteIdleNorth, spriteIdleSouth, spriteIdleEast, spriteIdleWest);
        }
    }

// Simple depth sorting, and lock player to interger position
x = floor(x);
y = floor(y);
depth = -y;


// View following
__view_set( e__VW.XView, 0, floor(median(0, room_width-__view_get( e__VW.WView, 0 ),  x-__view_get( e__VW.WView, 0 )/2 )));
__view_set( e__VW.YView, 0, floor(median(0, room_height-__view_get( e__VW.HView, 0 ), y-__view_get( e__VW.HView, 0 )/2 )));


