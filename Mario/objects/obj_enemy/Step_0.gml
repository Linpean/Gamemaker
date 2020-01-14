/// @description Insert description here
// You can write your code in this editor

if(IsBeDeath = 1)
{
	image_speed = 0;//如果敌人死亡，停止播放动画
	image_yscale = 0.2;//被踩扁
	
	if( timer >60)
	{
		instance_destroy();
	}
	timer +=1
}



//左右移动
var enemy_collision = 0;
enemy_collision = collision_point(x,y-1,obj_wall_father,0,0);
if (enemy_collision != noone) 
{
	face = - face;//如果碰到墙体就改变左右移动的方向
}

if (IsBeDeath = 0)
{
x = x + (global.enemy_speed*face);
}



//自由下落
if(IsBeAir == 0)
{		
		//如果敌人没有踩在墙体上，就开始自由下落
		temp = collision_line(x-6, y, x+5, y, obj_wall_father, 0, 0);
		if(temp == noone)
		{
			speed = 2;
			direction = 270;
			gravity = 0.3;		
			IsBeAir = 1;
		}
}

//落地逻辑
if(( IsBeAir == 1) && (direction == 270))
{	
	
	temp = collision_line(x-6, y+speed, x+5, y+speed, obj_wall_father, 0, 0);
	//如果玩家处于跳跃状态下，也检测是否与墙体发生碰撞
	if(temp)
	{	
			
		//如果发生碰撞，将其变成非空中状态,速度和力归0,并且开始左右移动
		IsBeAir = 0;
		speed = 0;
		gravity = 0;
		y = temp.y;
		//temp是返回的墙体实例ID，墙体的原点设定为（0，0），这里直接引用墙体的y坐标 
		
	}
}
