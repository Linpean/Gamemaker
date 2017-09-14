/// @description Draw the dialog
text_count += spd;//
text_visible = string_copy( text[text_page], 0, text_count);
//从一段文字，截取从0到text_count的长度

var xx = (x  - view_xport[0]) * display_scale;
var yy = (y -  view_yport[0]) * display_scale;

draw_text_ext( xx+margin, yy+margin, text_visible, -1, width - (margin * 2) );

