//
//  This object handles the fading transition from one room to another (or the same).
//  This works by the object being persistent, so after the fade to black and going to
//  the next room, it still exists! Then, it's just a matter of fading back in. Simple!
//  Other clear-to-screen transitions can be done in te same way. And this object is
//  simple to port to another project.
//

fadeOut = true;                 // Whether we are fading IN or OUT
color = c_black;                // The color to fade to
steps = 1*room_speed;           // Speed of the transition
destRoom = room_next(room);     // By default, we go to the next room
transition = 1;


