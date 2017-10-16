/// @description Controll the stats and Stamina Recover

if ( hp < 0){
	hp = 0;
}


// stamina recover
if ( (stamina < maxstamina) and (alarm[0] == -1) ){
	stamina ++;//恢复体力
}


// pause the game 关闭玩家角色的永久化，并且储存当前场景房间的索引，跳转到暂停界面
if (obj_input.pause_key){//当按下Z键时开始执行之下代码
	if (room != rm_pause){//判断当前房间是否是暂定的场景，不是则执行之下代码
		if(instance_exists(obj_player))	{//判断是否存在玩家角色实例，不存在则执行之下代码
			obj_player.persistent = false;//将玩家角色的数据永久化关闭
			previous_room = room;//将当前房间名存储到变量中
			room_goto(rm_pause);//去到暂定房间内
		}
	}else{//如果在暂停的房间，就回到之前储存的房间索引
		room_goto(previous_room);
	}
	obj_input.pause_key = false;
	//实际上由于检测方式，pause_key需要被重置为0，
	//不然循环执行（第1次，pause_key=1,进入暂停场景
	//第2次,pause_key还是为1，退出暂停场景，如此循环
}