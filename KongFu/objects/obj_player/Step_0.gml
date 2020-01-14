/// @description Insert description here



play_x_move_dir = 0;//静止
play_y_move_dir = 0;//静止
//每一帧都将方向初始化为静止，如果没有检测到按键，方向变量不会发生改变
//如果不每帧初始化，就需要在按键松开的时候，回复变量为0静止
//否则后续的帧，都会受到影响，明明没有按键，人却一直在移动
//处于落地，并且没有处于收招和出招状态才可以相应左右移动

//控制输入和更改移动状态
if(	 (action_state == 0)and (IsBeAir == 0) )
{	


	if ( keyboard_check(ord("A")) or keyboard_check(vk_left) )
	{
		play_x_move_dir = -1;//将其左右的移动的方向更改为左
		image_index += image_index_speed;
	}

	else if ( keyboard_check(ord("D")) or keyboard_check(vk_right) )
	{ 
		play_x_move_dir = 1;//将其左右的移动的方向更改为右
		image_index += image_index_speed;
	}
	
	
	if ( keyboard_check(ord("W")) or keyboard_check(vk_up) )
	{	
		//检测到跳起，更改垂直移动变量为-1向上，更改IsBeAir为1空中
		//并对应的根据当前的左右移动方向，设置跳起的朝向
		//然后设置在Y方向的速度
		play_y_move_dir = -1;
		IsBeAir = 1;
		if( play_x_move_dir !=0)
		{
			jump_face = play_x_move_dir;
		}
		direction = 90;
		speed = play_y_move_speed;
		gravity = 0.2;
		sprite_index = spr_player_jump;	
		
	}
	else if(keyboard_check(ord("S")) or keyboard_check(vk_down))
	{	
		//注意加上else,这里是说如果如果检测到了按上，那么就不需要检测按下了
		play_y_move_dir = 1;
		sprite_index = spr_player_jump;
	}
	
	if( keyboard_check(ord("J"))&& (IsBeAir == 0))
	//为什么这里要再判断一次IsBeAir=0呢，因为有可能进入外括号之前IsBeAir=0
	//但是因为按下了W,此时IsBeAir已经变成了1，但是这一帧的后方还有出腿需要执行
	//所以就有可能出现，飞起来的一瞬间，按下出腿,它还是可以出飞腿的
	{
		//出腿
		if(play_x_move_dir != 0)//出左右腿
		{
			scr_action_set(3,1,16);
		}
		else if( play_y_move_dir == 1)//蹲下原地出腿
		{
			scr_action_set(4,1,16);
		}
		else//原地出腿
		{
			scr_action_set(2,1,16);
		}		 
	}
	if( keyboard_check(ord("K")) && (action_state == 0) )
	//为什么这里要再判断一次action_state呢，因为有可能会打断出腿
	//所以再出腿后，立即需要判断是否还处于能够出拳的Action状态下
	{
		//出拳
		if(play_y_move_dir == 1)//蹲拳
		{
			scr_action_set(1,1,16);
		}
		else if(play_y_move_dir == 0)//原地出拳
		{
			scr_action_set(0,1,16);
		}		 
	}
}

//飞腿
if( (IsBeAir==1) &&  (action_state == 0) && keyboard_check(ord("J")) )
{
	scr_action_set(5,1,16);
}

//出招
if (action_state == 1)
{
	timer -=1;//计时器自减,在脚本时，timer已经被设置为16
	if( timer <= 0)//timer为0，即出招结束，变化状态
	{
		action_state = 2;//变为收招
		timer  = 8;//收招计时器
		//收招时的动作处理
		if((image_index == 1) or (image_index == 4) or (image_index == 5))
		{
			//1，4，5都是下蹲类的收招动作
			if(image_index == 5)
			{	
				//这里在飞腿出完之后，再给收招计时器timer赋值一次
				//这里赋值比较大的100帧，因为实际上角色在空中最多停留几十帧
				//也就是在出飞腿后一直处于倒计时中，无法再	出招
				//落地之后初始化timer=0，才可以出招
				timer = 100;//飞腿只能在空中出招一次
			}
			sprite_index = spr_player_jump;//变为跳跃动作
			//如果有sprite_index = xx，gms2会默认执行一次image_index = 0
			//即更换精灵时，会默认将动画帧数设置为0
		}
		else
		{
			//其他动作类的收招动作			
			sprite_index = spr_player_walk;
		}
		image_index = 0;//子图像序号归0
	}
}

//收招
if(action_state == 2)
{
	timer -=1;//计时器自减
	if(timer <=0)//转换状态
	{
		action_state = 0;//变成可移动状态
		sprite_index = spr_player_walk;//变成站立动画
		if(IsBeAir==1)
		{
			sprite_index = spr_player_jump;//变成跳跃动画
		}
		image_index = 0;//设置精灵的动画开最开始的一帧
		timer = 0;//计时器归0
	}
}


//下落
if((direction == 270) and (IsBeAir == 1) )
{
	if( (y+speed) > 191)//接近地平线
	{
		y = 191;
		gravity = 0;
		speed = 0;
		IsBeAir = 0;
		action_state = 0;
		timer = 0;
		jump_face = 0;
		sprite_index = spr_player_walk;
	}
}


//根据人物行走方向进行转向
if(IsBeAir ==0)
{
	if( x <= obj_enemy.x)
	{
		face = 1;//朝右
	} 
	else
	{
		face = -1;//朝左
	}
}
image_xscale = face;


//更改坐标，即移动
x += play_x_move_dir*play_x_move_speed;//贴地移动
x += jump_face*play_x_move_speed*2;//跳跃移动

//限制坐标，使其永远在屏幕内
if ( x < 24 )
{
	x = 24;
	jump_face = -jump_face;//跳跃中反向
}

if ( x > (room_width - 24))
{
	x = room - 24;
	jump_face = -jump_face;//跳跃中反向
}
