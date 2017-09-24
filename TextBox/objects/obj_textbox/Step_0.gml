/// @description page plus

if (keyboard_check_pressed(vk_space) ){
	// only increase page,if page+1, is more than the total number of entries
	if( charCount < string_length(text[page])){
		charCount = string_length(text[page]);
		//如果字符数已经大于文本长度，就不再进行判断直接等于文本长度即可，节省性能资源
	}
	else if ( (page +  1) < array_length_1d(text) ){
		page += 1;	
		charCount = 0;//重新计算字符
	}else{
		instance_destroy();
		creator.alarm[1] = 1;
	}
}
