/// @description  GetOppositeDirection(face);
/// @function  GetOppositeDirection
/// @param face
//
//  This is just a handy script that returns the opposite facing direction to
//  the given facing direction.
//
//*****************************************************************************

switch (argument0)
    {
    case (NORTH): return SOUTH;
    case (SOUTH): return NORTH;
    case (EAST):  return WEST;
    case (WEST):  return EAST;
    }