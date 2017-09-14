
if (hide)
    {
    // Randomly spawn a gem drop
    if (irandom(8) == 0)
        instance_create(x+16, y+16, objGreenGem);
    
    // Deactivate this instance to hide it
    // It is reactivated in objPlayer's Room Start event
    hide = false;                       // We can reset this, as this instance is deactivated now anyway
    myLife = life;                      // Restore life points
    x = xstart;                         // Restore to starting X position
    y = ystart;                         // Restore to starting Y position
    instance_deactivate_object(id);     // Deactivate (truly hidden)
    }


