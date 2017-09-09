scr_get_input();

//状态监测
if ( dash_key ){
	state = scr_dash_state;
	alarm[0] = room_speed /6; //将计时器的最大值设置为房间速度的6分之1,这也决定了一秒内会有多少个残影
}

if (attack_key){
	state = scr_attack_state;
}


// Get direction
dir = point_direction(0,0, xaxis,yaxis);//(计算两个点之间的向量方向）

// Get the length
if ( xaxis  ==0 and  yaxis == 0){
	len = 0;
} else {
	len = spd;
	scr_get_face();
}

// Get the hspd and vspd 
hspd= lengthdir_x(len, dir);
vspd= lengthdir_y(len, dir);
//hspd = xaxis * spd;
//vspd = yaxis * spd;


//Move
phy_position_x += hspd;
phy_position_y += vspd;

//Control the sprite
image_speed =	sign(len) *  image_speed_player;
if (len == 0){
	image_speed  = 0;//停止动画	
	image_index = 0;
}

switch ( face )
{
	case RIGHT:
		sprite_index = spr_player_right;
		break;
	case UP:
		sprite_index = spr_player_up;
		break;
	case LEFT:
		sprite_index = spr_player_left;
		break;
	case DOWN:
		sprite_index = spr_player_down;
		break;
}




/*
//Vertical sprites
if(vspd > 0){
	sprite_index = spr_player_down;
}
else if(vspd < 0){
	sprite_index = spr_player_up;
}

//Horizontal sprite
if(hspd > 0){
	sprite_index = spr_player_right;
}
else if(hspd < 0){
	sprite_index = spr_player_left;
}

//move left向左移动
if(  left_key ){
	phy_position_x -= spd;
	sprite_index = spr_player_left;
	image_speed  = image_speed_player;
}

//move right向右移动
if(  right_key ){
	phy_position_x += spd;
	sprite_index = spr_player_right;
	image_speed  = image_speed_player;
}

//move up向上移动
if(  up_key  ){
	phy_position_y -= spd;
	sprite_index = spr_player_up;
	image_speed  = image_speed_player;
}

//move down向下移动
if(  down_key  ){
	phy_position_y += spd;
	sprite_index = spr_player_down;
	image_speed  = image_speed_player;
}


//Stop animating
if(  !down_key and  !up_key  and !left_key and !right_key ){
	image_speed = 0;
	image_index = 0;
}
*/