#define scr_textEditor
///scr_textEditor( grid);

var
//_str = argument0,
_gr = argument0,
_g = 5,

//function
_on = 0;

draw_set_color(c_white);
draw_rectangle(0, rh -_gr, rw, rh, 1);

//cancelar
draw_rectangle(_g, rh -_gr +_g, _gr -_g, rh -_g, 1);
draw_sprite_ext(spr_menuIcons, 7, _gr/2, rh -_gr/2, 1.5, 1.5, 0, c_white, 1);

//aceptar
draw_rectangle(rw -_gr +_g, rh -_gr +_g, rw -_g, rh -_g, 1);
draw_sprite_ext(spr_menuIcons, 6, rw -_gr/2, rh -_gr/2, 1.5, 1.5, 0, c_white, 1);

//barra de texto
draw_rectangle(_gr +_g, rh -_gr +_g, rw -_gr -_g, rh -_g, 0);
draw_set_font(fnt_1B);
draw_set_color(c_black);
draw_text(_gr +_g +4, rh -_gr +_g +4, strEdit) //texto

if mouse_check_button_pressed(mb_left){
    //cancelar
    if point_in_rectangle(mouse_x, mouse_y, _g, rh -_gr +_g, _gr -_g, rh -_g){
        _on = 1; return(_on);
    }
    //aceptar
    else if point_in_rectangle(mouse_x, mouse_y, rw -_gr +_g, rh -_gr +_g, rw -_g, rh -_g){ 
        _on = 2; return(_on);
    }
    //barra de texto
    else if point_in_rectangle(mouse_x, mouse_y, _gr +_g, rh -_gr +_g, rw -_gr -_g, rh -_g){
        var _niuStr = get_string("Nombre", strEdit)
        if (_niuStr != ""){
            strEdit = _niuStr;
        }
    }
}

#define scr_listSelecter
///scr_listSelecter( grid);

var
//_str = argument0,
_gr = argument0,
_g = 5,
//_open = false,
//_arr = selObjArr,

//function
_on = 0;

draw_set_color(c_white);
draw_rectangle(0, rh -_gr, rw, rh, 1);

//cancelar
draw_rectangle(_g, rh -_gr +_g, _gr -_g, rh -_g, 1);
draw_sprite_ext(spr_menuIcons, 7, _gr/2, rh -_gr/2, 1.5, 1.5, 0, c_white, 1);

//aceptar
draw_rectangle(rw -_gr +_g, rh -_gr +_g, rw -_g, rh -_g, 1);
draw_sprite_ext(spr_menuIcons, 6, rw -_gr/2, rh -_gr/2, 1.5, 1.5, 0, c_white, 1);

//barra de texto
draw_rectangle(_gr +_g, rh -_gr +_g, rw -_gr -_g, rh -_g, 0);
draw_set_font(fnt_1B);
draw_set_color(c_black);
draw_text(_gr +_g +4, rh -_gr +_g +4, strEditShow) //texto

//lista
if (selObjArrOpen){
    for(var i = 0; i < selObjArrMax; i++){
        draw_set_color(c_white);
        draw_rectangle(_gr +_g, rh -_gr*(i+2) +_g, rw -_gr -_g, rh -_g -_gr*(i+1), 0);
        draw_set_color(c_black);
        draw_text(_gr +_g +4, rh -_gr*(i+2) +_g +4, selObjArrShow[i]) //texto
        
        if mouse_check_button_pressed(mb_left){
            if point_in_rectangle(mouse_x, mouse_y, _gr +_g, rh -_gr*(i+2) +_g, rw -_gr -_g, rh -_g -_gr*(i+1)){
                strEditShow = selObjArrShow[i];
                strEdit = selObjArrWrite[i];
                selObjArrOpen = false;
            }
        }
    }
}

if mouse_check_button_pressed(mb_left){
    //cancelar
    if point_in_rectangle(mouse_x, mouse_y, _g, rh -_gr +_g, _gr -_g, rh -_g){
        _on = 1; return(_on);
    }
    //aceptar
    else if point_in_rectangle(mouse_x, mouse_y, rw -_gr +_g, rh -_gr +_g, rw -_g, rh -_g){ 
        _on = 2; return(_on);
    }
    //barra de texto
    else if point_in_rectangle(mouse_x, mouse_y, _gr +_g, rh -_gr +_g, rw -_gr -_g, rh -_g){
        /*var _newStr = get_string("Nombre", strEdit)
        if (_niuStr != ""){
            strEdit = _newStr;
        }*/
        if selObjArrOpen selObjArrOpen = false;
        else selObjArrOpen = true;
    }
}