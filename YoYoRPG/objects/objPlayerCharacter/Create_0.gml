
// Basic stats for the character
mySpeed = 4;        // How fast the character will move


// Other control variables
beenHit = false;         // Wether the character has been hit.
staggerTimer = 0;        // Timer for when hit, (flashing, no-damage, no-input, etc)
face = SOUTH;            // Which way the character is facing
attacking = false;       // Currently performing an attack
controlsAble = true;     // Will the character will currently accept input
charging = false;
charge = 0;


// Change character sprites
switch (global.character)
    {
    case ("Boy"):      SetSpritesBoy();  break;
    case ("Girl"):     SetSpritesGirl(); break;
    case ("Scorpion"): SetSpritesScorpion(); break; // For LOLs, it works
    }

// First depth
depth = -y;

// Initialize view following
__view_set( e__VW.XView, 0, median(0, room_width-__view_get( e__VW.WView, 0 ),  x-__view_get( e__VW.WView, 0 )/2 ));
__view_set( e__VW.YView, 0, median(0, room_height-__view_get( e__VW.HView, 0 ), y-__view_get( e__VW.HView, 0 )/2 ));


