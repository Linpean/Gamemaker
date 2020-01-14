/// @description Insert description here
if(sprite_index == spr_object_wall_1 || sprite_index == spr_object_wall_2)
{
	//首先判断实例是否是可以被顶的两个墙体
	if((isBeDash == 1) and (direction ==270) and (y > ystart) )
	{
		//ystart：游戏创建时，实例的位置，或者说实例被创建时，实例的位置
		//被顶，从向上到向下的过程中，如果下落到一定程度，即超过了初始的y坐标
		//就停止墙体的运动，并且修改被顶状态为未被顶
		speed = 0;
		gravity = 0;
		isBeDash = 0;
		y = ystart;
		if(sprite_index = spr_object_wall_2)
		{	
			instance_create_depth(x,y,depth,obj_wall2);
			instance_destroy();
		}
		
	}
}