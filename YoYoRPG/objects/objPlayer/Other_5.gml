
// Reset/Free up things in the room that we don't want saved
with (parCollectible)
    {
    if (!placed)
        instance_destroy();
    }
with (objTemporary) instance_destroy();

// Put all things back where they started to avoid collision issues on return
with (all)
    {
    x = xstart;
    y = ystart;
    }

// Close all the doors
with (parDoor)
    image_index = 0;


