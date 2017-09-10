/// enemy wander
scr_check_for_player();
var dir = point_direction(x,y, targetx,targety);
var hspd = lengthdir_x(spd,dir);
var vspd = lengthdir_y(spd,dir);
image_xscale = sign(hspd);//hspd为正，面朝右
phy_position_x += hspd ; 
phy_position_y += vspd ; 