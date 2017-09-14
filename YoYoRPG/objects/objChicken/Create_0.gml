
event_inherited();


// Initial image settings
image_xscale = 1.0;
image_yscale = 1.0;


// Basic stats for the mob
life = 2;
mySpeed = 2;        // How fast this mob moves in pixels-per-step
docile = true;      // Whether this mob is docile (non-agressive)

face = SOUTH;
myLife = life;
paces = 0;
canMove = true;
horiSpeed = 0;
vertSpeed = 0;
state = STATE_IDLE;
idleTimer = 1*room_speed;


