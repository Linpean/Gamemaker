/// @description Draw the dialog
text_count += spd;//
text_visible = string_copy( text[text_page], 0, text_count);
//从一段文字，截取从0到text_count的长度

var xx = (x  - camera_get_view_x(view_camera[0])) * display_scale;
var yy = (y -  camera_get_view_y(view_camera[0])) * display_scale;
//获取游戏运行窗口的在游戏世界内的比例

draw_text_ext( xx+margin, yy+margin, text_visible, -1, width - (margin * 2) );

