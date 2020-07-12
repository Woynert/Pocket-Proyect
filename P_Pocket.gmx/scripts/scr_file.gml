///scr_file(id, x1, y1, state);

var 
_id = argument0,
_x1 = argument1,
_y1 = argument2,
_str = _id.name,
_sta = argument3,

_lastYM = yM;

//


//seleccionar icono
if (_id.type = -1){ //carpeta

    if (_id.nFiles > 0){ //lleno
        
        draw_sprite(spr_icons, 2+_id.open, _x1-20, _y1); //signo +/-
        
        //linea
        draw_set_color(c_gray);
        draw_line(_x1 -2, _y1 +8, _x1 -8, _y1 +8);
        switch(_sta){
            case 0: //con algo arriba
                draw_line(_x1 -13, yM+8-6, _x1 -13, yM+8-20); break; 
            case 1: //con carpeta padre arriba
                draw_line(_x1 -13, yM+8-6, _x1 -13, yM+8-20+8); break; 
            case 2: //con carpeta arriba
                draw_line(_x1 -13, yM+8-6, _x1 -13, yM+8-20+5); break; 
        }
    }
    else{ //vacio
        if (_id.open){
            _id.open = false;
        }
        
        //linea
        draw_set_color(c_gray);
        draw_line(_x1 -2, _y1 +8, _x1 -13, _y1 +8);
        switch(_sta){
            case 0: //con algo arriba
                draw_line(_x1 -13, yM+8, _x1 -13, yM+8-20); break; 
            case 1: //con carpeta padre arriba
                draw_line(_x1 -13, yM+8, _x1 -13, yM+8-20+8); break; 
            case 2: //con carpeta arriba
                draw_line(_x1 -13, yM+8, _x1 -13, yM+8-20+5); break; 
        }
    }

    //carpeta
    draw_sprite(spr_icons, _id.open, _x1, _y1);
}
else{ //archivos
    draw_sprite(spr_types, _id.type, _x1, _y1);
    
    //linea
    draw_set_color(c_gray);
    draw_line(_x1 -2, _y1 +8, _x1 -13, _y1 +8);
    switch(_sta){
        case 0: //con algo arriba
            draw_line(_x1 -13, yM+8, _x1 -13, yM+8-20); break; 
        case 1: //con carpeta padre arriba
            draw_line(_x1 -13, yM+8, _x1 -13, yM+8-20+8); break; 
        case 2: //con carpeta arriba
            draw_line(_x1 -13, yM+8, _x1 -13, yM+8-20+5); break; 
    }
}

/*/linea vertical
if (_id.padre != noone){ //obj no raiz
    /*if (_id.padre.file[_id.padre.nFiles-1] = _id){
        //draw_line(_x1 -13, _y1 +8, _x1 -13, _y1 +10-20*_id.padre.nFiles);
    }//
}
else{ //obj raiz
    if (i = 6){
        //draw_set_color(c_gray);
        //draw_line(_x1 -13, _y1 +8, _x1 -13, 50+4/*_y1 +8-10*6/);
    }
}*/

//sombra de seleccionado
if (selTreeJ = _id){
    draw_set_color(merge_color(c_blue, c_white, 0.35));
    draw_rectangle( _x1 +25 -4, _y1, _x1 +25 +string_width(_str) +1, _y1 +20 -3, 0);
}

//nombre de carpeta
draw_set_color(c_white);
draw_text(_x1 +25, _y1, _str);

//interactuar
if mouse_check_button_pressed(mb_left){

    //seleccionar
    if point_in_rectangle(mouse_x, mouse_y, _x1 +2, _y1, _x1 +25 +string_width(_str), _y1 +20){
        if (toMove != -1){
            selTreeI = _id;
        }
        else selTreeJ = _id;
    }
    
    //abrir/cerrar (solo carpetas)
    if (_id.type = -1) and (_id.nFiles > 0) and (toMove = -1){ //comprobar si hay archivos
        if point_in_rectangle(mouse_x, mouse_y, _x1-20+3, _y1+4, _x1-20+3+9, _y1+4+9){
            if (_id.open) //(abrir y cerrar)
                _id.open = false; 
            else 
                _id.open = true;
            selTreeJ = _id; selTreeI = -1; //seleccionar
        }
    }
}

//si tiene archivos
if (_id.type = -1) and (_id.nFiles > 0) and (_id.open){
    //ejecutar por cada archivo
    for(var j = 0; j < _id.nFiles; j++){
        
        _sta = 0;
    
        yM += 20; //actualizar posicion
    
        if (j > 0){ //dibujar linea larga
            if (_id.file[j-1].type = -1){
                if (_id.file[j-1].open){
                    draw_set_color(c_gray);
                    draw_line(_x1 +20-13, yM+8, _x1 +20-13, _lastYM+8+5);
                    
                }
                if (_id.file[j-1].nFiles > 0){
                    _sta = 2; //con carpeta arriba
                }
            }
        }
        
        _lastYM = yM; //guardar posicion anterior
        
        //states
        if (j = 0){ //con carpeta padre arriba
            _sta = 1;
        }
        
        draw_set_font(fnt_1);
        scr_file(_id.file[j], _x1 +20, yM, _sta);
        
    }
    
    //sumar cascada
    _n += _id.nFiles;
    _subN += _id.nFiles;
}



