/// @description Collect health
with( other ){
	instance_destroy();
}

with(obj_player_stats){
	hp = min(hp + 5, maxhp);
}
