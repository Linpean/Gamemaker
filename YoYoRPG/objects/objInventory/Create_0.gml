
// Window sizes
width = 7*128;
height = 4*128;

// Inventory sizes
invWidth = 5;      // Inventory slots wide
invHeight = 4;     // Inventory slots high

// Initial variables
selection = 0;          // Currently highlighted slot
onCloseButton = 0;  // Is the close button highlighted
onTitle = 1;
onWeapon = 2;
onArmour = 3;
onInventory = 4;

on = onTitle;

// Create grid
slots = ds_grid_create(invWidth*invHeight, 9);
ds_grid_clear(slots, -1);


