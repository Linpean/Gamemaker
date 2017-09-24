/// @description 

// get input again
scr_get_input();

// pause the game
if (pause_key){
	if (room != rm_pause){
		if(instance_exists(obj_player))	{
			obj_player.persistent = false;
			previous_room = room;
			room_goto(rm_pause);
			//关闭玩家角色的永久化，并且储存当前场景房间的索引
			//跳转到暂停界面
		}
	}else{
		room_goto(previous_room);
		
		//在暂停界面再次按住ESC，会返回到之前的界面
	}
}