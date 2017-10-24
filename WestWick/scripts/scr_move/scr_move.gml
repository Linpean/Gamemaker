/// @function scr_move(hspd , vspd)
/// @description 
/// @param hspd
/// @param vspd

// 脚本参数（形参）
var hspd = argument0;
var vspd = argument1;

// Horizontal move 水平移动
if (!place_meeting( x+hspd, y, obj_solid)){
	x += hspd;
	//如果调用该脚本的实例向右移动hspd个像素
	//仍然不和由obj_solid对象创建的实例发生碰撞
	//就将该实例的x坐标增加hspd个像素
}

// Vertical movement 垂直移动
if (!place_meeting(x, y+vspd, obj_solid)){
	y += vspd;
}

// Return true if we are able to move 返回是否能够发生移动
// 只要x和y坐标任意一个发生变化就返回true
//return (( x != xprevious) or (y != yprevious));


var dir = point_direction(0,0, hspd,vspd);
var moved = ( x != xprevious || y != yprevious); 

//update the sprite index
if(!moved){
	//如果人物在这一帧没有移动，
	//就设置帧动画速度为0，精灵子图片为第一张图片
	image_speed = 0;
	image_index = 0;
} else{
	//如果移动过，获取移动的方向来决定人物朝向
	image_speed = 0.2;
	facing = scr_get_facing(dir);
	
}