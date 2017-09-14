
image_speed = 0;                // Cease animation
image_index = image_number-1;   // Reset to last image

if (!open)
    {
    // Flag as opened
    open = true;
    PersistanceLog(id);
    
    if (containsItem)
        {
        // Drop item on ground
        if (canDropOnGround)
            {
            dropTimer = 1;
            dropNumber = item[ITEM_COUNT];
            }
        
        // Put item directly into the inventory
        else
            InventoryAdd(item);
        }
    }


