
if (hide)
    {
    // Randomly spawn a gem drop
    if (irandom(100) < dropChance) {
        var _newGem = instance_create(x+16, y+16, objGreenGem);
    }
    
    // Create an instance to show the cut animation
    _inst = instance_create(x, y, objTemporary);
    _inst.sprite_index = sprBushCutDesert;
    
    // Create an instance to show the stump
    var _inst;
    _inst = instance_create(x, y, objTemporary);
    _inst.sprite_index = sprCactusStump;
    
    // Deactivate this instance to hide it
    // It is reactivated in objPlayer's Room Start event
    hide = false;                       // We can reset this, as this instance is deactivated now anyway
    instance_deactivate_object(id);     // Deactivate
    }

