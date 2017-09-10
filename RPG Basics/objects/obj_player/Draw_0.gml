/// @Draw the shadow
draw_self();
draw_sprite(spr_player_shadow,image_index, x,y);
draw_healthbar( x + 7, y - 13, x-7, y - 16 , obj_player_stats.hp/obj_player_stats.maxhp * 100, c_black, c_red, c_lime, 1, true, true);

