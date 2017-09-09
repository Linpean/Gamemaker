///@description scr_enemy_stall_state

show_debug_message("exe:scr_stall");

scr_check_for_player();
if( alarm[1] <= 0){
	state = scr_enemy_idle_state;
}