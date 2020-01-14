image_index  = argument0;//动作帧
action_state = argument1;//动作状态
timer = argument2;//动作时长

sprite_index = spr_player_atk;//将动画变成攻击的精灵索引


var dx,dy;//攻击判断的出拳出脚位置
dx = x + 26*image_xscale;
dy = y - 16;
//x，y是玩家脚下的中心点，加上26*image_xscale像素（根据xscale的值，1和-1）
//-16是向上16个像素位置
audio_play_sound(snd_atk1,1,false);
//播放音效

if(	collision_point(dx, dy, obj_enemy,0,0))
{	
	//攻击判断的点是否碰到的敌人
	if(obj_enemy.hp >0)
	{
		//只能打到活的敌人
		audio_play_sound(snd_hit1,1,false);//播放音效
		timer += 16;//出招定帧帧数，即前摇时间
		instance_create_depth(dx, dy, depth-10, obj_hitfx);
		//在攻击判断的位置播放特效，注意深度较少10，是为了将特效绘制在人物前面
		obj_enemy.hp -=1;//敌人血量减少1
		obj_enemy.hited = 16;//受击定帧时间，即受击僵直时间
		
	
	}
}