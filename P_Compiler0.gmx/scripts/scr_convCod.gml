///scr_convCod(ind); Añadir soporte para distinta sintaxis

var _code = code[argument0];

//soporte para for
var __code = string_replace(_code, " ", "");
var __code = string_replace(__code, "   ", "");

if string_copy(__code, 1, 3) = "for"{

    //recorrer el string
    var _stt = 0, _end = 0, _ord = 0, __strLgt = string_length(__code);
    for (var i = 1; i <= __strLgt; i++){
        _ord = string_ord_at(__code, i);
        
        if _ord = 40{ //(40 )41 ;59
            _stt = i+1;
            
            //variable
            for (var j = i; j <= __strLgt; j++){
                _ord = string_ord_at(__code, j);
                
                if (_ord = 59){ //;59
                    _end = j;
                    break;
                }
            }
            cvCode[array_length_1d(cvCode)] = string_copy(__code, _stt, _end-_stt) + " -1";
            show_message(string_copy(__code, _stt, _end-_stt));
            
            //condicion
            _stt = _end +1;
            for (var j = _stt; j <= __strLgt; j++){
                _ord = string_ord_at(__code, j);
                if (_ord = 59){
                    _end = j;
                    break;
                }
            }
            show_message(string_copy(__code, _stt, _end-_stt));
            cvCode[array_length_1d(cvCode)] = "while (" + string_copy(__code, _stt, _end-_stt) + " -1)";
            
            //incremento
            _stt = _end +1;
            for (var j = _stt; j <= __strLgt; j++){
                _ord = string_ord_at(__code, j);
                if (_ord = 41){ 
                    _end = j;
                    break;
                }
            }
            show_message(string_copy(__code, _stt, _end-_stt));
            
            //ubicar debajo de la siguiente llave {123
            for (var j = argument0; j <= array_length_1d(code); j++){
                if string_count("{", code[j]){
                    cvCode[array_length_1d(cvCode)] = "{";
                    cvCode[array_length_1d(cvCode)] = string_copy(__code, _stt, _end-_stt);
                    Im = j +1;
                    _code = code[Im];
                    break;
                }
            }
        }
    }
}
cvCode[array_length_1d(cvCode)] = _code;
