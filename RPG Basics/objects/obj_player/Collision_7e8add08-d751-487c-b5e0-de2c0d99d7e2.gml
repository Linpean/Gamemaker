/// @description Collect expr
with( other ){
	instance_destroy();
	//玩家碰撞到经验值，将经验值对象删除
}

with(obj_player_stats){
	expr += 1;
	//然后玩家数据对象中的expr的值加1
	if(expr >= maxexpr){
		level += 1;
		expr = expr -  maxexpr;
		var expr_var1 = level
		maxexpr = 2 * expr_var1 * expr_var1 ;
		//当前获得经验大于最大经验值，人物升级
		//然后当前经验值归0
		//最大经验值增加，下次升级更难
		
		//**升级能力成长**
		hp += 2;
		maxhp += 2;
		stamina += 2;
		maxstamina += 2;
		attack += 1; 
	}
}
