/// @description Set the player persistence
if (instance_exists(obj_player)){
	obj_player.persistent = true;
	//关闭暂停界面
	show_debug_message(obj_player.persistent);
	//在每次场景初始化时，开启角色对象永久化
	//因为前往暂停这个特定的room会关闭角色对象永久化
}
