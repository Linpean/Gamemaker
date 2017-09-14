
// Set alpha depending on fade IN/OUT
if (fadeOut) draw_set_alpha(1.0-transition);
else         draw_set_alpha(transition);

// Draw, you could even replace this with an image! (Helpful if the target room takes a while to load)
draw_set_color(color);
draw_rectangle(0, 0, browser_width, browser_height, false);

// Reset alpha
draw_set_alpha(1.0);


