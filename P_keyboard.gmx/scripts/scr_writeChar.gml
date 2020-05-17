///scr_writeChar(Char);


with(obj_screen){
    txt += string(ord(argument0))+" ";
}

//Apagar shift encendido
if (mayus = 1){
    mayus = 0;
    scr_letter();
}

