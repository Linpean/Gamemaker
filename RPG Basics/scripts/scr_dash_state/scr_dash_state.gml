scr_get_input();
//在进行冲锋之前获取角色朝向的方向，

if (len == 0){
	dir = face * 90;//但是这无法进行斜向的冲锋,所以只有len为0
	//即yaxis和xaxis为0，没有移动按键输入的情况下才生效
	//而在有按键输入的情况下，scr_move_state先执行
	//在执行中dir由xaxis和yaxis决定
}


//冲锋距离
len = spd *  4;

// Get the hspd and vspd 
hspd= lengthdir_x(len, dir);
vspd= lengthdir_y(len, dir);
//hspd = xaxis * spd;
//vspd = yaxis * spd;


//Move
phy_position_x += hspd;
phy_position_y += vspd;

//Create the dash effect
var dash = instance_create_depth(x, y, depth, obj_dash_effect);//在原地创建一个实例
dash.sprite_index = sprite_index;//将该实例的精灵设置为调用该脚本的实例的精灵
dash.image_index = image_index;






















