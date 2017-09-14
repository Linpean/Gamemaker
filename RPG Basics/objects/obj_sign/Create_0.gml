/// @description Initialize the sign
event_inherited();

text = noone;

text_visible  = "";
text_page = 0;
text_count = 0;
spd = 0.5;//增加一个字符所需要的时间
display_scale  =display_get_gui_height() / view_wport[0];
//获得UI层级的比例

width = sprite_width * display_scale;
margin = 8;
