
// Draw our text, with alpha lowered near end of lifespan
draw_set_alpha(timer/20);
draw_set_halign(fa_center);
draw_text_outline(x, y, text, 2, c_white, c_black);

// Reset drawing settings
draw_set_color(c_white);
draw_set_alpha(1.0);


