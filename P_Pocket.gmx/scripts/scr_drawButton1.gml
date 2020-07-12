///scr_drawButton1(_xl, _yl, i, _txt);

var
_xl = argument0,
_yl = argument1,
_j = argument2,
_txt = argument3;

draw_rectangle(_xl*_j, rh -_yl, _xl*(_j+1), rh, 1); //dibujar boton
draw_text_ext(_xl*_j+4, rh -_yl+2, _txt, 18, _xl-4); //texto

if mouse_check_button_pressed(mb_left){
    if point_in_rectangle(mouse_x, mouse_y, _xl*_j, rh -_yl, _xl*(_j+1), rh){ //comprobar click
        return (1);
    }
}
