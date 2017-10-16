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
	
	if (obj_input.dash_key){
		switch(menu_index){
			case 0:
				//Return
				room_goto(obj_player_stats.previous_room);
				break;
				
			case 1:
				//Save
				scr_game_save();
				break;
			
			case 2:
				// Load
				break;
				
			case 3:
				//Quit
				game_end();
				break;
		}
		obj_input.dash_key = false;
	}
	

}
