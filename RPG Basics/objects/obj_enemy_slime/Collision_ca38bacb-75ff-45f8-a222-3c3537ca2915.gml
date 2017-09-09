/// @description Damage the player
if ( state != scr_enemy_stall_state ){
	var dir = point_direction( other.x, other.y ,x, y ,);
	var xdir = lengthdir_x(1,dir);
	var ydir = lengthdir_y(1,dir);
	var damage = instance_create_depth(other.x+xdir , other.y+ ydir, depth, obj_damage);
	damage.creator = id;
	damage.knockback = 5;
	state = scr_enemy_stall_state;
	alarm[1] = room_speed;
}