/// @description Move
// 获取键盘输入，来设置人物移动的水平和竖直移动方向

//keyboard_check每帧都会触发和返回，keyboard_check_pressed()只会返回按下那刻
//水平移动速度，由方向键的左右两个键的按下情况决定，
var hspd = (obj_input.right - obj_input.left) * spd;
//竖直移动速度，由方向键的上下两个键的按下情况决定
var vspd = (obj_input.down - obj_input.up) * spd;


// move 调用移动脚本
scr_move(hspd, vspd);


//Update the sprite
sprite_index = sprite[facing];