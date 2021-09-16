#define scr_configButtons
///scr_configButtons(_title, _content, _ym);

var
_title = argument0,
_content = argument1,
_ym = argument2;

//constantes
var
_x1 = 15,
_x2 = rw-15,
_anc = 20, //ancho
_txtYa = 1;

//visible
draw_set_color(c_white);
draw_text(_x1, _ym +_txtYa, _title); _title = "Visible:  ";
//caja de texto
draw_set_color(c_white);
draw_rectangle(_x1 + string_width(_title), _ym, _x2, _ym +_anc, 0);
//texto
draw_set_color(c_black);
draw_text(_x1 +5 + string_width(_title), _ym +_txtYa, _content);
//action
if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, _x1 + string_width(_title), _ym, _x2, _ym +_anc)){
    return 1;
}
else{
    return 0;
}

#define scr_configVarReset
///scr_configVarReset();

//in
strEdit = "";
strEditShow = ""; 

for(var i = 0; i < array_length_1d(selObjArrWrite); i++){
    selObjArrShow[i] = noone;
    selObjArrWrite[i] = noone;
}
selObjArrMax = 0;
selObjArrOpen = false;

//out
typeObjEdit = 0; //1 caja de texto //2 lista desplegable
toObjEdit = 0;
applyObjEdit = false;