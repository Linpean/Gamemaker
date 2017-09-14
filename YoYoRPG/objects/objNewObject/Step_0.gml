
if (animate)
    {
    if (round(image_index) == image_number)
        {
        instance_destroy();
        }
    }
else
    {
    // Code animation, don't try this at home, kids!
    x = lerp(x, destX, 0.1);
    y = lerp(y, destY, 0.1);
    jumpDir = lerp(jumpDir, 0, 0.2);
    jumpY = lengthdir_y(jumpDistance, jumpDir);
    
    if (jumpDir < 10)
        {
        if (timesJumped++ < 1)
            {
            jumpDistance /= 2;
            jumpDir = 180;
            }
        }
    
    
    // We've reached where we were meant to land
    if (point_distance(x, y, destX, destY) < 1)
        {
        // Create object is attached
        if (object != -1)
            instance_create(x, y, object);
             
        // If we haven't disabled despawning
        if (despawn)
            instance_destroy();
        }
    }
    
// Depth sort
depth = -y;


