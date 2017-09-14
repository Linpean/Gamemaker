/// @description Drop Expr


if ( scr_chance(0.5) ){
	instance_create_depth(x,y, depth, obj_expr);
}else if ( scr_chance(0.5) ){
	instance_create_depth(x + 6,y + 6, depth, obj_health);
}