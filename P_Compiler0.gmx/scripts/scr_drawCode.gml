///scr_drawCode();

//background
draw_set_color(c_ltgray);
draw_rectangle(0, 0, rw, rh, 0);

show_debug_overlay(true);
draw_set_color(c_black);
draw_set_font(fnt_0);

//sombreado
draw_set_color(c_yellow);
for(var i = 0; i < array_length_1d(code); i++){
    if (executed[i]){
        draw_rectangle(10, 10+string_height("L")*(i+1), 10+string_width(code[i]), 10+string_height("L")*(i+2)-2, 0); 
    }
    if (i = lastLineExed){
        draw_set_color(c_red);
        draw_rectangle(10, 10+string_height("L")*(i+1), 10+string_width(code[i]), 10+string_height("L")*(i+2)-2, 0); 
        draw_set_color(c_yellow);
    }
}

//recopilar Code
draw_set_color(c_black);
var _txt = "";
for(var i = 0; i < array_length_1d(code); i++){
    _txt += "#"+code[i];
}
draw_text_ext(10, 10, _txt, 20, rw/4);

/*/sombreado
draw_set_color(c_yellow);
for(var i = 0; i < array_length_1d(cvCode); i++){
    if (executed[i]){
        draw_rectangle(floor(rw/4)*1+10, 10+string_height("L")*(i+1), floor(rw/4)*1+10+string_width(cvCode[i]), 10+string_height("L")*(i+2)-2, 0); 
    }
    if (i = lastLineExed){
        draw_set_color(c_red);
        draw_rectangle(floor(rw/4)*1+10, 10+string_height("L")*(i+1), floor(rw/4)*1+10+string_width(cvCode[i]), 10+string_height("L")*(i+2)-2, 0); 
        draw_set_color(c_yellow);
    }
}*/

//recopilar comvertedCode
var _txt = "";
draw_set_color(c_black);
for(var i = 0; i < array_length_1d(cvCode); i++){
    _txt += "#"+cvCode[i];
}
draw_text_ext(floor(rw/4)*1+10, 10, _txt, 20, rw/4);

//sombreado
draw_set_color(c_yellow);
for(var i = 0; i < array_length_1d(cCode); i++){
    if (executed[i]){
        draw_rectangle(floor(rw/4)*2+10, 10+string_height("L")*(i+1), floor(rw/4)*2+10+string_width(cCode[i]), 10+string_height("L")*(i+2)-2, 0); 
    }
    if (i = lastLineExed){
        draw_set_color(c_red);
        draw_rectangle(floor(rw/4)*2+10, 10+string_height("L")*(i+1), floor(rw/4)*2+10+string_width(cCode[i]), 10+string_height("L")*(i+2)-2, 0); 
        draw_set_color(c_yellow);
    }
}

//recopilar compileCode
var _txt = "";
draw_set_color(c_black);
for(var i = 0; i < array_length_1d(cCode); i++){
    _txt += "#"+cCode[i];
}
draw_text_ext(floor(rw/4)*2+10, 10, _txt, 20, rw/4);



//numeros
var _txt = "";
for(var i = 0; i < array_length_1d(cCode); i++){
    _txt += "#"+string(i);
}
draw_set_color(c_red);
draw_text_ext(floor(rw/4)*2-15, 10, _txt, 20, rw/4);


//recopilar console
var _txt = "";
for(var i = 0; i < array_length_1d(cl); i++){
    _txt += "#"+cl[i];
}
draw_text_ext(floor(rw/4)*3+10, 10, _txt, 20, rw/4);

//dibujar keylist
for(var i = 0; i < array_height_2d(linKey); i++){
    show_debug_message(string(linKey[i, 0]) + " : " + string(linKey[i, 1]) + " Repeat: " + string(linKey[i, 2]));
}

