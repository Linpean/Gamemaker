///scr_game_save

///Make sure the player exists
if (!instance_exists(obj_player)){
	exit;
}

///Create the save data structure
var save_data = ds_map_create();

with( obj_player_stats){
	save_data[?"room"] = previous_room;
	save_data[?"x"] = 0;
	save_data[?"y"] = 0;
	save_data[?"hp"] = hp;
	save_data[?"maxhp"] = maxhp;
	save_data[?"stamina"] = stamina;
	save_data[?"maxstamina"] = maxstamina;
	save_data[?"expr"] = expr;
	save_data[?"maxexpr"] =maxexpr;
	save_data[?"level"] = level;
	save_data[?"attack"] = attack;
}

//转化为字符串形式，以便存储和读取

var save_string  = json_encode(save_data);//json_encode能够将一个ds_map结构转化为字符串

show_message(" Game Saved");