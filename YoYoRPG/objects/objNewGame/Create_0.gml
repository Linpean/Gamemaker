
// Window sizes
width = 7*128;
height = 4*128;

global.autoFile = "yyrpg_auto.ini";
global.saveFile = "yyrpg_slot_1.ini";

selected = 0;

var _loadFile, _n;
for (_n=1; _n<4; _n++)
    {
    // Defaults
    slotName[_n-1] = "SLOT "+string(_n);
    slotGems[_n-1] = -1;
    slotHearts[_n-1] = -1;
    slotLocation[_n-1] = -1;
    
    // Get file name for this slot
    _loadFile = "yyrpg_slot_"+string(_n)+".ini";
    slotFile[_n-1] = _loadFile;
    
    // If a file for this slot exists, get info from it
    if (file_exists(_loadFile))
        {
        ini_open(_loadFile);
        slotCharacter[_n-1] = ini_read_string("Player", "Character", "Boy");
        slotGems[_n-1] = ini_read_real("Player", "Gems", 0);
        slotLife[_n-1] = ini_read_real("Player", "Life", 5);
        slotHearts[_n-1] = ini_read_real("Player", "Hearts", 5);
        slotLocation[_n-1] = ini_read_string("Location", "Room", rmTownNew);
        ini_close();
        }
    }


