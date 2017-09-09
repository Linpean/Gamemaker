//scr_check_for_player

if ( instance_exists(obj_player) ){
	 var dis = point_distance(x, y, obj_player.x, obj_player.y);
	 if( dis  <  sight){
		targetx = obj_player.x;
		targety = obj_player.y;
		state = scr_enemy_chase_state;
	 } else{
		scr_enemy_choose_next_state();
	 }
	 //如果玩家在怪物的视野范围内，就设定目标点，并执行追击脚本
	 //如果玩家不在怪物的视野范围内，就再次执行选择脚本状态（漫游和待机）
}else{
	scr_enemy_choose_next_state();
}