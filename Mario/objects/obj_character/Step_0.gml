/// @description Insert description here

var temp = 0;
var distance_x = 0;//水平步距

//死亡状态
if (dead_state = 1)
{	

	//以下的这些行为我们都只执行一次，所以使用计数器==x的判断方式
	if(timer == 0)
	{
		//刚死亡的一瞬间
		sprite_index = spr_m0_dead;
		speed = 0;
		image_speed = 0;
		gravity = 0;
		
	}
	
	if ( timer == 20)
	{	
		//20帧后，向上跳起
		direction = 90;
		speed = 4;
		gravity = 0.4;
	}
	
	if (timer > 180)
	{	
		//180帧后重新开始游戏
		game_restart();
	}
	
	timer += 1;
	exit;//死亡后，不执行该处以后的代码
}



//左右移动
if( keyboard_check(vk_left) or keyboard_check(ord("A")) )
{
	distance_x = -1;//向左移动
}

if( keyboard_check(vk_right) or keyboard_check(ord("D")) )
{
	distance_x = 1;//向右移动
}

if(distance_x != 0)
{
	x += distance_x*x_speed;//人物开始移动
	image_xscale = face;//使用image_xscale内置变量来改变精灵图片的朝向
	face = distance_x;//改变脸的朝向
	if(jump == 0)
	{
		//在非跳跃状态下，水平移动才播放动画
		sprite_index = spr_m0_walk_strip4;//改变精灵
		image_index += x_sprite_speed;//播放精灵动画
		
	}

}
//将代码放在distance_x被赋值的后方
//一旦检测到输入，distance就会在每帧被赋值为0的后面，再次被赋值
//然后，角色的x坐标自然也会发生变动，也就是人物开始行走了



//左右碰撞

temp = collision_line(x+x_speed*distance_x, y-2, x+x_speed*distance_x, y-15, obj_wall_father, 0, 0);
//使用distance_x表示向左走还是向右走，根据行走方向来判断使用左还是右的蓝线进行碰撞
//为了防止因为角色像素与地面发生碰撞，y坐标向上提高2个像素
if(temp)
{
	//如果发生碰撞，需要根据方向来设定x的坐标
	if(distance_x == -1)
	{	
		//如果向左移动，将马里奥的原点x坐标设为碰撞到的墙体的原点（左上角）坐标 + 16 +6的位置
		x = temp.x + 16 + 6;
	}
	if(distance_x == 1)
	{
		//如果向右移动，将其放在墙体原点x坐标-6的位置
		x = temp.x - 6;
	}
}






//跳跃和自由下落
if(jump == 0)
{	
	//检测跳跃输入
	if ( keyboard_check(vk_space) or  keyboard_check(ord("J")) )
	{	
		jump = 1;
		audio_play_sound(snd_jump, 1,false,);
		speed = 7;
		direction = 90;
		gravity = 0.3;
		sprite_index = spr_m0_jump;//设置跳跃的精灵动画
	
	}
	
	
	temp = collision_line(x-6, y, x+5, y, obj_wall_father, 0, 0);
	//如果玩家处于非跳跃状态下，使用碰撞函数检测马里奥的脚底一条直线是否与墙体发生碰撞
	//如果发生碰撞，函数返回碰到的实例id
	if(temp == noone)
	{	
		//如果没有发生碰撞，将其改变为jump状态
		//给他一个向下的初速度，并且设定重力加速度
		jump = 1;
		speed = 2;
		direction = 270;
		gravity = 0.3;		
	}
		
}

//落地逻辑
if((jump == 1) && (direction == 270))
{	
	
	temp = collision_line(x-6, y+speed, x+5, y+speed, obj_wall_father, 0, 0);
	//如果玩家处于跳跃状态下，也检测是否与墙体发生碰撞
	if(temp != noone)
	{	
		//如果发生碰撞
		jump = 0;
		speed = 0;
		gravity = 0;
		y = temp.y;
		//temp是返回的墙体实例ID，墙体的原点设定为（0，0），这里直接引用墙体的y坐标 
		sprite_index = spr_m0_stand;
		//落地后将其精灵图片设置为正常站立姿态 
	}
	
	//踩踏怪物
	
	temp = collision_line(x-6, y+speed, x+5, y+speed, obj_enemy, 0, 0);
	if(temp != noone)	
	{
		if( temp.IsBeDeath == 0)
		{
			//如果发生碰撞，且碰到的是活的怪物,死的怪不能被踩了
			audio_play_sound(snd_cai,1,false); 
			speed = 3.5;//
			direction = 90//马里奥向上被弹起
			temp.IsBeDeath = 1;//将怪物变成死亡状态		
		}
	}
}


//死亡事件
temp = collision_line(x-6, y+speed, x+5, y+speed, obj_enemy, 0, 0);
if (temp != noone)
{
	if ( temp.IsBeDeath = 0)
	{	
		//非跳跃和下落状态下，碰到活的敌人，马里奥死亡
		dead_state = 1;
		audio_play_sound(snd_dead,1,false);
	}
}


//顶撞逻辑
//在向上跳时，判断头顶是否与墙体发生碰撞

if((jump == 1) && (direction == 90))
{
	temp = collision_line(x-6, y-speed-15, x+5, y-speed-15, obj_wall_father, 0, 0);
	//加入speed参数进行预先判断
	//头顶,即y-15的直线如果发生碰撞，将的速度方向改为向下，速度设置为2
	if(temp)
	{	
		audio_play_sound(snd_hitwall,1,false, );
		speed = 2;
		direction = 270;
		y = temp.y + 16 + 13;//根据精灵的头的位置，适当调节参数
		//如果顶到了是墙和问号，使用精灵文件来甄别
		if((temp.sprite_index == spr_object_wall_1 || temp.sprite_index == spr_object_wall_2) and (temp.isBeDash = 0)  )
		{
			with(temp)
			{	
				//直接把一下的代码放到temp中，临时执行一次。
				isBeDash = 1;//设置被顶到的墙的状态为被顶过
				speed = 2;
				direction = 90;
				gravity = 0.3;//顶到就设置一个重力效果 
				
			}
			if(temp.sprite_index == spr_object_wall_2)
			{
				instance_create_depth(temp.x+8,temp.y,depth,obj_coin);
			}
		}
		
	}	
}



//移动限制
if (x < 8 )
{
	x = 8
}

if( x > (room_width - 8) )
{
	x = room_width - 8
}