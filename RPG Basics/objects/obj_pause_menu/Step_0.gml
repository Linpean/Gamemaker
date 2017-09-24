/// @description Control the menu

if ( alarm[0]  <= 0 ){
	if(obj_input.down_key){
		if(menu_index < array_length_1d(option) -1){
			menu_index++;  
		}else {
			menu_index = 0;
		}
		alarm[0] = game_get_speed(gamespeed_fps)/6;
		//设定按下生效的间隔频率，否则会按step的速度来相应用户的切换menu
	}
	
	if(obj_input.up_key){
		if(menu_index > 0){
			menu_index--;  
		}else {
			menu_index =array_length_1d(option) - 1;
		}
		alarm[0] = game_get_speed(gamespeed_fps)/6;
	}

}
