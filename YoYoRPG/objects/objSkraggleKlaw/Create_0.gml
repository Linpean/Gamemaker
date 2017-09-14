
event_inherited();


// Initial image settings
SetSpritesSkraggleKlaw();
image_xscale = 1.0;
image_yscale = 1.0;


// Basic stats for the mob
life = 20;
mySpeed = 1;        // How fast this mob moves in pixels-per-step
docile = false;     // Whether this mob is docile (non-agressive)


myLife = life;
paces = 0;
face = choose(NORTH, EAST, SOUTH, WEST);
canMove = true;
horiSpeed = 0;
vertSpeed = 0;
state = STATE_IDLE;
stateSwitched = false;
idleTimer = 1*room_speed;
staggerTimer = -1;
beenHit = false;


