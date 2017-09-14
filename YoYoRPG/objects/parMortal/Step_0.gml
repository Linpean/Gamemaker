
if (myLife <= 0)
    hide = true;


if (hide)
    {
    PlaySound(snd_EnemyDeath);
    EventLog("EnemyDefeated", object_index);
    QuestUpdate();
    
    if (permadeath)
        {
        instance_destroy();
        exit;
        }
    
    // Spawn death bones effect
    if (spriteDeathBits != -1)
        {
        var _n, _x, _y;
        for (_n=0; _n<sprite_get_number(sprScorpionBones); _n++)
            {
            _x = x+lengthdir_x(16+random(32), random(360));
            _y = y+lengthdir_y(16+random(32), random(360));
            _newItem = instance_create(x, y, objNewObject);
            _newItem.sprite_index = spriteDeathBits;
            _newItem.image_index = _n;
            _newItem.destX = _x;
            _newItem.destY = _y;
            }
        }
    else
        {
        var _i;
        _newItem = instance_create(x, y, objNewObject);
        _i = id;
        _newItem.face = face;
        with (_newItem) SetSpriteFromFace(_i.spriteDeathNorth, _i.spriteDeathSouth, _i.spriteDeathEast, _i.spriteDeathWest);
        _newItem.image_index = 0;
        _newItem.image_speed = 0.3;
        _newItem.animate = true;
        }
    
    // Randomly spawn a gem drop
    if (irandom(8) == 0)
        instance_create(x+16, y+16, objGreenGem);
    
    // Deactivate this instance to hide it
    // It is reactivated in objPlayer's Room Start event
    hide = false;                       // We can reset this, as this instance is deactivated now anyway
    myLife = life;                      // Restore life points
    beenHit = false;
    x = xstart;                         // Restore to starting X position
    y = ystart;                         // Restore to starting Y position
    instance_deactivate_object(id);     // Deactivate (truly hidden)
    }


