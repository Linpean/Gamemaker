
// Will replace these with constants when GM:S Asset Packages actually support them!
globalvar KEY_UP;     KEY_UP     = vk_up;
globalvar KEY_DOWN;   KEY_DOWN   = vk_down;
globalvar KEY_RIGHT;  KEY_RIGHT  = vk_right;
globalvar KEY_LEFT;   KEY_LEFT   = vk_left;
globalvar KEY_ACTION; KEY_ACTION = ord("X");
globalvar KEY_ATTACK; KEY_ATTACK = ord("Z");

globalvar KEY_INVENTORY_EQUIP; KEY_INVENTORY_EQUIP = ord("X");
globalvar KEY_INVENTORY_MOVE;  KEY_INVENTORY_MOVE  = ord("Z");
globalvar KEY_INVENTORY_OPEN;  KEY_INVENTORY_OPEN  = ord("I");

globalvar KEY_PAUSE; KEY_PAUSE = ord("P");

globalvar ITEM_NAME;        ITEM_NAME        = 0;
globalvar ITEM_TYPE;        ITEM_TYPE        = 1;
globalvar ITEM_COUNT;       ITEM_COUNT       = 2;
globalvar ITEM_OBJECT;      ITEM_OBJECT      = 3;
globalvar ITEM_ICON;        ITEM_ICON        = 4;
globalvar ITEM_DESCRIPTION; ITEM_DESCRIPTION = 5;
globalvar ITEM_EFFECT;      ITEM_EFFECT      = 6;
globalvar ITEM_SPRITESET;   ITEM_SPRITESET   = 7;
globalvar ITEM_VALUE;       ITEM_VALUE       = 8;

globalvar ITEM_TYPE_WEAPON;        ITEM_TYPE_WEAPON = 1;
globalvar ITEM_TYPE_PLACEABLE;     ITEM_TYPE_PLACEABLE = 2;
globalvar ITEM_TYPE_POTION_HEALTH; ITEM_TYPE_POTION_HEALTH = 3;

globalvar NORTH; NORTH = 0;
globalvar EAST;  EAST  = 2;
globalvar SOUTH; SOUTH = 1;
globalvar WEST;  WEST  = 3;

globalvar STATE_IDLE;    STATE_IDLE    = 0;
globalvar STATE_TURN;    STATE_TURN    = 1;
globalvar STATE_MOVE;    STATE_MOVE    = 2;
globalvar STATE_STOP;    STATE_STOP    = 3;
globalvar STATE_ATTACK;  STATE_ATTACK  = 4;
globalvar STATE_CHASE;   STATE_CHASE   = 5;
globalvar STATE_STAGGER; STATE_STAGGER = 6;

// Will gradually replace above stuff with enums, enums are cool
enum Animation {
    loop,
    bounce,
    swing,
}

// Dailogue contexts
enum Context {
    intro    = 0,
    progress = 1,
    ending   = 2
}

// Text alignments, also used for dialogue drawing checks
enum Alignment {
    top    = fa_top,
    middle = fa_middle,
    bottom = fa_bottom
}


// Load settings
ini_open("yyrpg.ini");
global.enableAudio = ini_read_real("settings", "audio", true);
global.enableMusic = ini_read_real("settings", "music", true);
ini_close();


