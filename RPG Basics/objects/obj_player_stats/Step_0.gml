/// @description Controll the stats and Stamina Recover

if ( hp < 0){
	hp = 0;
}

if ( (stamina < maxstamina) and (alarm[0] == -1) ){
	stamina ++;//恢复体力
}
