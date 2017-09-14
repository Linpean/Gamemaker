
// Reset and stay on first frame
image_speed = 0;
image_index = image_number-1;

// PLay sound
if (useSfx != -1)
    PlaySound(useSfx);

// Set the global spawn do to our target, so objPlayer Control can access it
global.spawnDoor = targetDoor;

// If going to new room, or re-entering the current room
var _dest;
if (targetRoom != -1)
    _dest = targetRoom;
else
    _dest = room;
    
var _transition;
_transition = instance_create(0, 0, objTransition);
_transition.destRoom = _dest;
_transition.steps = 0.25*room_speed;


