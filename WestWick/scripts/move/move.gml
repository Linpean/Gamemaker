/// @description move(hspd, vspd)
/// @function move
/// @param hspd
/// @param  vspd
var hspd = argument0;
var vspd = argument1;

// Horizontal movement
if (!place_meeting(x+hspd, y, o_solid)) {
    x += hspd;
}

// Vertical movement
if (!place_meeting(x, y+vspd, o_solid)) {
    y += vspd;
}

// Return true if we are able to move
return x != xprevious || y != yprevious;


