
// Has attached object
if (object != -1)
    draw_sprite(object_get_sprite(object), image_index, x, y+jumpY);

// No object, try sprite
else if (sprite_index != -1)
    draw_sprite(sprite_index, image_index, x, y+jumpY);


