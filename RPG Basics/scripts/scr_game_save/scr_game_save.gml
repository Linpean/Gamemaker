///scr_game_save

///Make sure the player exists  确认玩家实例的存在
if (!instance_exists(obj_player_stats)){ 
	//这里只能判断obj_player_stats的存在，obj_play在pause场景中是不存在的
	exit;
}

///Create the save data structure  创建一个Ds_map结构变量
var save_data = ds_map_create();

with( obj_player_stats){             //在Ds_map结构添加以下映射关系
	save_data[? "room"] = previous_room;
	save_data[? "x"] = 0;
	save_data[? "y"] = 0;
	save_data[? "hp"] = hp;
	save_data[? "maxhp"] = maxhp;
	save_data[? "stamina"] = stamina;
	save_data[? "maxstamina"] = maxstamina;
	save_data[? "expr"] = expr;
	save_data[? "maxexpr"] =maxexpr;
	save_data[? "level"] = level;
	save_data[? "attack"] = attack;
}

//转化为字符串形式，以便存储和读取

var save_string  = json_encode(save_data);//json_encode能够将一个ds_map结构转化为字符串（Javascript对象）
ds_map_destroy(save_data);//在转化后，销毁ds_map结构变量

//使用Base64的加密方式，对字符串进行加密
save_string = base64_encode(save_string);

var file  = file_text_open_write(working_directory + "mysavegame.txt");//在工作目录下新建一个文本文件
file_text_write_string(file,save_string);//将经过Json编码后的字符串写入到该文本文件内
file_text_close(file);//关闭该文本文件



show_message (" Game Saved");