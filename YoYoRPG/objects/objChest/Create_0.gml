
if (ds_list_find_index(objGame.persistanceEvents, id) != -1)
    {
    open = true;
    dropTimer = -1;
    image_speed = 0;
    image_index = image_number-1;
    }
    
else
    {
    // Start closed
    open = false;
    dropTimer = -1;
    dropDirection = 270;
    
    // Default contents, nothing
    containsItem = false;                       // Default, chest contains NO item
    canDropOnGround = false;                    // Drops on ground, or false = directly put into inventory
    item = ItemGetDefine("NO NAME", -1, 1, -1, -1, "NO DESCRIPTION", -1, 0, 0);
    
    // Pause animation on first frame
    image_speed = 0;
    image_index = 0;
    }

// Simple depth sort
depth = -y-4;


