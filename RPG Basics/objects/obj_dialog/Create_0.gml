/// @description Initialize the dialog object
text = noone;

text_visible  = "";
text_page = 0;
text_count = 0;
spd = 0.5;//增加一个字符所需要的时间
display_scale  =display_get_gui_width() / camera_get_view_width(view_camera[0])
//获得UI层级的比例
//获得游戏运行窗口的比例

width = sprite_width * display_scale;
margin = 8;