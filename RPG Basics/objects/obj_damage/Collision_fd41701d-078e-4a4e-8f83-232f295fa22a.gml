/// @description Activate the dialog
with( other ){
	 //如果当前不存在对话框，就创建一个对话框
	 if( !instance_exists( dialog) ){
		dialog = instance_create_depth(x + xoffset, y + yoffset, depth, obj_dialog)
		dialog.text = text;
	 } else{
		dialog.text_page++;
		dialog.text_count = 0;
		//如果对话框已经存在，对话文本就翻到下一页。
		if ( dialog.text_page >  (array_length_1d(dialog.text) - 1)  ){
			//如果页数已经大于文本的最大的页数,就代表已经看完了文本
			//对文本对话框进行销毁
			with(dialog){
				instance_destroy();
			}
		}
	 }
}


