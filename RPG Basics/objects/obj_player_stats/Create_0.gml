/// @description Initialize the player's stats
#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3

hp = 100;
attack = 1;
maxhp = hp;
stamina =  10;//体力
maxstamina =  stamina;
expr = 0;
maxexpr = 3;
level  = 1;
global.dash_cost = 5;
previous_room = room;


Hanyi = font_add("HanYiQuanTang.ttf",18,true,true,0,65535);


draw_set_color(c_white);//