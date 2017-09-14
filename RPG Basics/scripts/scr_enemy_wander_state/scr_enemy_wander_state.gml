/// enemy wander

scr_check_for_player();//检查视野内是否存在敌人
if ( point_distance(x,  y, targetx, targety)  >  spd){

	//如果与选取的漫游点的距离小于最小的步距，就不向着该点进行移动
	//避免在原地进行小碎片的移动的抖动表现
	var dir = point_direction(x,y, targetx,targety);//判断怪物需要移动的方向
	var hspd = lengthdir_x(spd,dir);
	var vspd = lengthdir_y(spd,dir);
if (hspd != 0){
	image_xscale = sign(hspd);//hspd为正，面朝右
}
	//向着目标移动
	phy_position_x += hspd ; 
	phy_position_y += vspd ; 
}