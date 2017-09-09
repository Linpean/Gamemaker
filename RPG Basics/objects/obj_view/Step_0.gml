/// @move 10% towards  the player

//current = (target - current）* 0.1
if ( instance_exists(obj_player) ){
	x += (obj_player.x - x) * 0.1;
	y += (obj_player.y - y) * 0.1;
}