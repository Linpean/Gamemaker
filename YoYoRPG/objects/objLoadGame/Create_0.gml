
// Window sizes
width = 7*128;
height = 4*128;

onTitle = 0;
onSaveContButton = 1;
onSaveQuitButton = 2;
onLoadButton = 3;
onCloseButton = 4;

on = onTitle;

global.autoFile = "yyrpg_auto.ini";
global.saveFile = "yyrpg_slot_1.ini";

selected = 0;

// Get data from save files
var _loadFile, _n, _newSlot;
for (_n=0; _n<4; _n++)
    {
    // Defaults
    if (_n == 0) slotName[_n] = "AUTOSAVE";
    else         slotName[_n] = "SLOT "+string(_n);
    slotGems[_n] = -1;
    slotHearts[_n] = -1;
    slotLocation[_n] = -1;
    
    if (_n == 0) _loadFile = global.autoFile;
    else         _loadFile = "yyrpg_slot_"+string(_n)+".ini";
    slotFile[_n] = _loadFile;
    
    // If a file for this slot exists, get info from it
    if (file_exists(_loadFile))
        {
        ini_open(_loadFile);
        slotCharacter[_n] = ini_read_string("Player", "Character", "Boy");
        slotGems[_n] = ini_read_real("Player", "Gems", 0);
        slotLife[_n] = ini_read_real("Player", "Life", 5);
        slotHearts[_n] = ini_read_real("Player", "Hearts", 5);
        slotLocation[_n] = ini_read_string("Location", "Room", rmTownNew);
        ini_close();
        }
    }

