/// scr_attack_state 
///负责进行切换成攻击状态，执行攻击行为

var attack_image_speed = 0.7;
image_speed =  attack_image_speed;

switch( sprite_index ){
	case spr_player_down:
	sprite_index = spr_player_attack_down;
	break;
	
	case spr_player_up:
	sprite_index = spr_player_attack_up;
	break;
	
	case spr_player_right:
	sprite_index = spr_player_attack_right;
	break;
	
	case spr_player_left:
	sprite_index = spr_player_attack_left;
	break;
}


if (  (image_index >= 4)  and   (attacked = false) ){
	//image_index是浮点变化的，有可能不会等于某个精确的值
	//而越过它向前
	//4是指到第4帧时才造成伤害，相当于前摇时间
	var xx_offset = 0;
	var yy_offset = 0;
	switch( sprite_index ){
		case spr_player_attack_down:
		xx_offset = x;
		yy_offset = y +12;
		break;
	
		case spr_player_attack_up:
		xx_offset = x;
		yy_offset = y - 10;
		break;
	
		case spr_player_attack_right:
		xx_offset = x + 10;
		yy_offset = y + 2	;
		break;
	
		case spr_player_attack_left:
		xx_offset = x - 10;
		yy_offset = y +2;
		break;
	}
		
	var damage = instance_create_depth(xx_offset,yy_offset,depth, obj_damage );
	damage.creator = id;
	damage.damage = obj_player_stats.attack;
	//将obj_damage的creator属性等于调用scr_attack_state脚本的实例id
	//就等于排除了对调用该脚本的实例伤害，因为在obj_damage的碰撞时间中
	//有条件判断 other.id != creator
	attacked = true;
	//并且只检测一次伤害，造成伤害后，马上将attacked标记为true
	//在攻击动画还在播放的下一帧就不会创建damage对象造成伤害了

}



















