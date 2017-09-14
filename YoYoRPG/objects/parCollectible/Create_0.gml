
placed = true;

depth = -y;
image_speed = 1/6;
image_index = irandom(image_number);

if (ds_list_find_index(objGame.persistanceEvents, id) != -1)
    {
    placed = false;     // Stops it logging again... Hack fix
    instance_destroy();
    }


