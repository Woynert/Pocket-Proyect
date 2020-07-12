#define scr_drawCode
///scr_drawCode(x, y, string); dibujar codigo en pantalla

var 
_x = argument0,
_y = argument1,
_str = argument2,
_nStr = "",
_chAt = "",
_case = 0, //0 = normal; 1 = comentario;
_s = "";

for (var k = 1; k <= string_length(_str); k++){
    _chAt = string_char_at(_str, k);
    switch(_chAt){ 
    
        //comentario
        case "/": 
            if ((k < string_length(_str)) and (string_char_at(_str, k+1) = "/")){
                _case = 1; 
                draw_set_color(merge_color(c_lime, c_white, 0.5)); draw_set_font(fnt_2Italic);
                _chAt += string_copy(_str, k+1, string_length(_str)-k);
                k += string_length(_str)-k;
            }
        break;
        
        //numeros
        case"0": case"1": case"2": case"3": case"4": case"5": case"6": case"7": case"8": case"9":
            if (_case = 0) draw_set_color(scr_wordColor(2));
        break;
        
        //default
        default: 
            if (_case = 0){
                //comprobar cada palabra cable
                for (var n = 1; n <= scr_keyWords(0); n++){ 
                
                    //comprobar letra inicial
                    _s = scr_keyWords(n);
                    if (_chAt = string_char_at(_s, 1)){ 
                        if ((string_length(_str)-k+1) >= string_length(_s)) and (string_copy(_str, k, string_length(_s)) = _s){
                            
                            //comprobar si no está interrumpida
                            var _chr = ord(string_char_at(_str, k+string_length(_s)));
                            if ((_chr > 64 and _chr < 91) or (_chr > 96 and _chr < 123)){
                                draw_set_color(scr_wordColor(0)); break;
                            }
                            
                            _chAt = _s; //agarrar la expresion completa
                            k += string_length(_s)-1; //reposicionar
                            break;
                        }
                    }
                    draw_set_color(scr_wordColor(0)); //no detectado
                }
            }
        break;
    }
    
    //dibujar
    draw_text(_x +string_width(_nStr), _y, _chAt);
    _nStr += _chAt;
}



#define scr_keyWords
///scr_keyWords(n);

switch(argument0){
    case 0: return(8); break;
    case 1: draw_set_color(scr_wordColor(1)); return("var");  break;
    case 2: draw_set_color(scr_wordColor(1)); return("keyboard_check");  break;
    case 3: draw_set_color(scr_wordColor(1)); return("if");  break;
    case 4: draw_set_color(scr_wordColor(1)); return("else");  break;
    case 5: draw_set_color(scr_wordColor(2)); return("vk_left");  break;
    case 6: draw_set_color(scr_wordColor(2)); return("vk_right");  break;
    case 7: draw_set_color(scr_wordColor(2)); return("vk_up");  break;
    case 8: draw_set_color(scr_wordColor(2)); return("vk_down");  break;
}

#define scr_wordColor
///scr_wordColor(n);

switch(argument0){
    case 0: return(make_colour_rgb(220, 220, 220)); break; //normal
    case 1: return(make_colour_rgb(255, 184, 113)); break; //funciones
    case 2: return(make_colour_rgb(255, 128, 128)); break; //valores
}