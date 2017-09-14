///@description scr_enemy_chase_state

show_debug_message("exe:scr_chase");
scr_check_for_player();

var dir = point_direction(x,y, targetx,targety);
var hspd = lengthdir_x(spd,dir);
var vspd = lengthdir_y(spd,dir);
if (hspd != 0){
	image_xscale = sign(hspd);//hspd为正，面朝右
	phy_position_x += hspd ; 
	phy_position_y += vspd ; 
}
/*
phy_position_x += sign(targetx - x) * spd ; 
//sign返回的是-1，0，1，这回返回是向右还是向左移动
phy_position_y += sign(targety - y) * spd ; 
//不直接使用obj_player.x作为目标点，而是由外部设定targetx，保持该脚本的独立性
*/
