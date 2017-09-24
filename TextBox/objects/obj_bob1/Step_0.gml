/// @description Check collide


if(place_meeting(x,y, obj_player)){
	//if I have not already created the textbox,then make one.
	if (keyboard_check_pressed(vk_space) ){
		if(myTextbox = noone){
			myTextbox = instance_create_layer(x,y, "Text", obj_textbox);
			myTextbox.text = myText;
			myTextbox.creator = self;
			myTextbox.name = myName;
		}
	}
} else{
	if(myTextbox != noone){
		//销毁实例之前必须保证实例存在，调用并不存在的实例将导致程序奔溃
		instance_destroy(myTextbox);
		myTextbox = noone;
		//因为在创建obj_text时，被myTextbox所引用
		//令其为noone，防止实例已经被销毁了，但myTextbox变量还在引用造成报错
	}
	//如果没有发生碰撞就删除TextBox实例 
}
