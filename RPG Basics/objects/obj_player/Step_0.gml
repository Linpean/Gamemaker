/// @Move the player in the step event


//移除event_inherited();

depth = -y;
script_execute(state);

//check for death
if (obj_player_stats.hp <= 0){
	instance_destroy();
}