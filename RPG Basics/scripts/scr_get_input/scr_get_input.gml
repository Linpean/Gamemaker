/// scr_get_input

//***检测按键***
//缓冲速度

left_key =  (  keyboard_check(ord("A")) or keyboard_check(vk_left) )  ;
right_key = (  keyboard_check(ord("D")) or keyboard_check(vk_right) ) ;
up_key = (  keyboard_check(ord("W")) or keyboard_check(vk_up) ) ;
down_key = (  keyboard_check(ord("S")) or keyboard_check(vk_down) ) ;

dash_key = keyboard_check_pressed(ord("J"));//冲锋
attack_key = keyboard_check_pressed(ord("K"));//攻击

// Get  the axis
xaxis  = (right_key - left_key);
yaxis  = (down_key - up_key);


//Check for gamepad input**检测手柄输入
if( gamepad_is_connected(0) )
{
	xaxis =  gamepad_axis_value(0, gp_axislh) ;
	yaxis = gamepad_axis_value(0, gp_axislv);
	dash_key = gamepad_button_check_pressed(0, gp_face1);
	attack_key = gamepad_button_check_pressed(0, gp_face3 );
}







