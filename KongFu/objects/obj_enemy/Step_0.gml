/// @description Insert description here


//死亡判断

if(hp<=0)
{
	if(timer == 0)//死亡第一帧
	{
		audio_stop_all();
		audio_play_sound(snd_fall1,10,0);
		sprite_index = spr_enemy_dead;
	}
	timer += 1;//计时器自加
	if(timer > 180)
	{
		game_restart();//3秒后重启游戏
	}
	exit;//结束代码执行

}


//简单的移动逻辑
if(hited == 0)//未被打击
{
	if(x >= (obj_player.x + 12))//在右边
	{
		x -=0.25;//左移
		image_index += 0.1;
	}
	else if(x <= (obj_player.x - 12))
	{
		x+=0.25;//右移
		image_index +=0.1;
	}
}
else
{
	hited -=1;//静止，等待打击效果结束
	//在scr_action_set里面受到打击时，赋值为16
}

//方向变化
if((x <= obj_player.x) and (IsBeAir == 0))
{
	face = 1;
}
else
{
	face = -1;
}
image_xscale = face;
