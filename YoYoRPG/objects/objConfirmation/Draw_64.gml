
// Get stuff
var _width   = window_get_width();
var _height  = window_get_height();
var _centerX = _width * 0.5;
var _centerY = _height * 0.5;
var _panelW  = 8 * 64;
var _panelH  = 5 * 64;

// Dimmed backdrop
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, _width, _height, false);

// Panel
DrawPanel(_centerX-_panelW/2, _centerY-_panelH/2, _panelW, _panelH, false, false);

// Text
draw_sprite(sprConfirmTextBox, 0, _centerX, _centerY-48);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext(_centerX, _centerY-48, string_hash_to_newline(message), -1, 340);

// Buttons
if (useOkay)
    {
    DrawButton("Okay", on==onYes, _centerX, _centerY+_panelH/2-64);
    }
else
    {
    DrawButton("Yes", on==onYes, _centerX-128, _centerY+_panelH/2-64);
    DrawButton("No",  on==onNo,  _centerX+128, _centerY+_panelH/2-64);
    }


