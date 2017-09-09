/// @description Change back to move state

if (state = scr_attack_state){
	state = scr_move_state;
	attacked = false;//将攻击状态改为未在进行攻击中
}