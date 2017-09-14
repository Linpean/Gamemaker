
event_inherited();

// Default text (speech)
textPickRandomly = false;
text[0, 0] = "NO TEXT SET#Set in creation code of instance in room editor!";
type[0, 0] = 0;
response[0, 0] = "";
outcome[0, 0] = -1;

// Initial settings
SetAvatar("J. Doe", -1);
SetSpritesNPCMale();

// Basic stats for the mob, some of these are variable but can also be frozen
life = 2;           // How many hitpoints the mob has
mySpeed = 2;        // How fast this mob moves in pixels-per-step
docile = false;     // Whether this mob is docile (non-agressive)
canMove = true;     // Can this mob move at all
canTurn = true;     // If can't move, can atleast turn periodically
face = SOUTH;       // Initial facing direction, sense in use with "canTurn"

// Initial variables, these always change
myLife = life;              // Current hitpoints
paces = 0;                  // How far to walk before stopping
horiSpeed = 0;              // Horizontal movement speed
vertSpeed = 0;              // Vertical movement speed
state = STATE_IDLE;         // Current state, see step event for list and behaviour
idleTimer = 1*room_speed;   // How long to remain in the IDLE state


