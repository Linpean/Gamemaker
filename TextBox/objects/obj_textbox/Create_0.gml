/// @description Insert description here

font_text = font_add("STXINWEI.TTF",18, true, true, 0, 65535);

//text page
page = 0;

//text value
text[0] = "this is a long string with lots of words,:),这里是一段很长的字符串";


xBuffer = 10;
yBuffer = 10;


//set text box size
boxHeight = sprite_get_height(spr_box);
boxWidth = sprite_get_width(spr_box);
stringHeight = string_height(text[0]);

creator = noone;

charCount = 0;//截取的文本段落字符数量

name = noone;//说话人的名字