/// @description Draw the dialog

//**Get the last space**
if ( string_char_at( text[text_page],  text_count) ==" "){
	last_space = text_count;
	//获得当前对话内单词的最后的空格处所在的字符顺序数
}

//**add smart return**
var text_words = scr_string_copy_words(text[text_page], 1 , text_count);
if(  string_width(text_words) >= (width - (margin * 2) )  ){
	 text[text_page] = string_delete(text[ text_page ], last_space, 1);
	 //从文本中删除从last_space位置开始删除一个字符
	 
	  text[text_page] = string_insert("#", text[text_page], last_space);
	  //返回在此处被删除的字符
}


// ** Get the visible text**

text_visible = string_copy( text[text_page], 0, text_count);
//从一段文字，截取从0到text_count的长度

//**update the text location** 
var xx = (x  - camera_get_view_x(view_camera[0])) * display_scale;
var yy = (y -  camera_get_view_y(view_camera[0])) * display_scale;
//获取游戏运行窗口的在游戏世界内的比例


//**draw the text** 
draw_text_ext( xx+margin, yy+margin, text_visible, -1, width - (margin * 2) );

// add to count
text_count += spd;
 