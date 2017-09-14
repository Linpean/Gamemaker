
if (hide)
    {
    // Randomly spawn a gem drop
    if (irandom(100) < dropChance) {
        var _newGem = instance_create(x+16, y+16, objGreenGem);
    }
    
    // Create an instance to show the "cut" state
    _inst = instance_create(x, y, objTemporary);
    _inst.sprite_index = sprPotSmash;
    
    // Deactivate this instance to hide it
    // It is reactivated in objPlayer's Room Start event
    hide = false;                       // We can reset this, as this instance is deactivated now anyway
    instance_deactivate_object(id);     // Deactivate
    }


