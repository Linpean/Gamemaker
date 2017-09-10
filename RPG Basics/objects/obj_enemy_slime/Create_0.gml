/// @Initialize  the slime 
event_inherited();
image_speed = 0.1;
spd = 1;
state = scr_enemy_idle_state;
//在怪物出生时，默认设置为idle待机状态
alarm[0] = room_speed * irandom_range(2,5);
//room_speed= 房间速度，1秒60帧，alarm会每step减1
//这样的写法就是2秒到5秒
sight = 50;//怪物视野
targetx = 0;
targety = 0;
