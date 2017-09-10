/// @description Damage all lifeforms
if ( other.id  != creator ){
	other.hp -=damage;//碰撞到的生命体的生命值减1
	//如果实例other的id不为空就执行伤害代码
	
	show_debug_message(other.hp);
	if(instance_exists(creator)){
		var dir =  point_direction(creator.x, creator.y, other.x, other.y);
	}else{
		var dir =  point_direction(x, y, other.x, other.y);
	}
	
	var x_force = lengthdir_x(knockback, dir);
	var y_force = lengthdir_y(knockback, dir);

	//设置力的方向和大小，注意力是有方向的，这里采用x和y方向合力
	
	with( other )
	{
		physics_apply_impulse(x, y, x_force, y_force);
		//在碰到的实例的位置创建一个冲击力来击退碰撞到的实例
	}	
}