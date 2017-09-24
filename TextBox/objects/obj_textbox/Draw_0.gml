/// @description Insert description here
// You can write your code in this editor


//draw textbox 
draw_rectangle(x-2,y-2, x+boxWidth+2, y+boxHeight+2,false);
draw_sprite(spr_box, 0, x, y)



//set font  设置字体
draw_set_font(font_text);


// increment character counter every frame 增加字符计数
if (charCount <= string_length(text[page]) ){
	charCount += 1;//每step显示的文本多加一个字符
}

// copy part of the text
textPart = string_copy(text[page], 1, charCount);//截取当前应该显示的文本段落




//Draw the name
draw_set_color(c_yellow);
var name_xx = x + boxWidth/2;
var name_yy = y + yBuffer;
draw_set_halign(fa_center);
draw_text(name_xx, name_yy, name)

//Draw part of the text
draw_set_color(c_white);
var text_xx = x + xBuffer;
var text_yy = y + yBuffer + stringHeight;
draw_set_halign(fa_left);
draw_text_ext(text_xx, text_yy, textPart, stringHeight, boxWidth- (2 * xBuffer));