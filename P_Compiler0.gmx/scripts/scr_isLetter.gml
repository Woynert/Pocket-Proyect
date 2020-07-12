#define scr_isLetter
//scr_isLetter(ord);

var _ord = argument0;

if (_ord > 64) and (_ord < 91) or (_ord > 96) and (_ord < 123) or (_ord = 95){  
    return(true); exit; //si es
}
return(false); //no es una letra

#define scr_isNumber
//scr_isNumber(ord);

var _ord = argument0;

if (_ord > 47) and (_ord < 58) or (_ord = 92) or (_ord = 46) { //\ .
    return(true); exit; //si es
}
return(false); //no es un numero