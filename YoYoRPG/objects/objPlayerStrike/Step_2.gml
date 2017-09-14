
// Follow the player, the reason is this is done in Endstep is so it's always the characters position AFTER updating
if (instance_exists(objPlayerCharacter))
    {
    // Move to player
    x = objPlayerCharacter.x;
    y = objPlayerCharacter.y;
    
    // Set draw depth based on direction, relative to player
    switch (face)
        {
        case (NORTH): depth = objPlayerCharacter.depth+1; break;
        case (SOUTH):
        case (EAST):
        case (WEST):  depth = objPlayerCharacter.depth-1; break;
        }
    }

// The player character doesn't exist, so there's no reason for this to either
else
    {
    instance_destroy();
    }


