
var _show = true;
_show &= !instance_exists(objTransition);
with (parPauseMenu)
    _show &= !visible;

if (_show)
    {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fntHud);
    draw_set_color(c_white);
    
    // Draw the HUD (Heads Up Display)
    DrawLifeHearts(display_get_gui_width()-32, 48);
    DrawEquippedWeapon(48, 48);
    DrawCoinsCounter(96, 48);
    }


