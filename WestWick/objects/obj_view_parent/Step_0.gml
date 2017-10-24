/// @description Update the view position

//获取摄像机的当前位置，并且设置摄像机的移动
var vx =  (camera_get_view_x(view_camera[0]) / 2) + irandom_range(-screenshake,screenshake);
var vy =  (camera_get_view_y(view_camera[0]) / 2) + irandom_range(-screenshake,screenshake);
camera_set_view_pos(view_camera[0], vx,vy);

//move the view towards the target point 使摄像机向目标点移动
//使用线性插值，并且由于每个step都会更新x的值，会使得x不断逼近target的x坐标
//spd每次逼近的程度，在每个step事件中就表示逼近速度了
x = lerp(x,target[? "x"], spd); 
y = lerp(y,target[? "y"], spd);

