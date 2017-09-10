/// @description Draw the player's stats
draw_set_font(Hanyi);
draw_set_halign(fa_left);
c_hanyi = make_colour_rgb(114, 153, 158);
c_background = make_colour_rgb(223, 228, 225);
draw_rectangle_colour(28, 28, 200, 130, c_background, c_background, c_background, c_background, false);
draw_text_color( 32 , 32, "生命："+string(hp)  + "/" + string(maxhp) ,c_hanyi, c_hanyi, c_hanyi, c_hanyi, 1);
draw_text_color( 32 , 64, "体力："+string(stamina)  + "/" + string(maxstamina),c_hanyi, c_hanyi, c_hanyi, c_hanyi, 1);
draw_text_color( 32 , 96, "等级："+string(level),c_hanyi, c_hanyi, c_hanyi, c_hanyi, 1);


