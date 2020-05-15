///scr_recComp();


var 
_code = code[argument0],
_strCopy = -1,
_strLgt = string_length(_code),
_val1 = "",//;
_qt = 0;



//bajar punto y comas
//(puesEso)

//quitar punto y comas
_code = string_replace_all(_code, ";", "");

//renombrar variables
for (var i = 1; i <= _strLgt; i++){
    var _ord = string_ord_at(_code, i);
    
    if scr_isLetter(_ord) and (_qt = 0){ //start read
        if (_strCopy = -1){
            //show_message(_ord);
            _strCopy = i;
        }
    }
    else if (_ord = 34 or _ord = 39){ //" '
        if (_qt = 0){ //abrir
            _qt = _ord;
        }
        else if (_qt = _ord){ //cerrar
            _qt = 0;
        }
        
    }
    
    if (_strCopy != -1){ 
    
        //copiar el string
        var _i = scr_isLetter(_ord) or scr_isNumber(_ord);
        //show_message(string(_i) + " : "+ string(chr(_ord)));
        
        if !_i or (_i and (i = _strLgt)){ //if !scr_isLetter(_ord) or (scr_isLetter(_ord) and (i = _strLgt)){
            _val1 = string_copy(_code, _strCopy, i-_strCopy+_i);
            
            
            //evaluarlo
            var _fe = scr_fucExists(_val1)
            var _ve = scr_valExists(_val1);
            
            
            if (_fe != -1){ //es función
                _code = string_replace(_code, _val1, "B"+string(_fe)+":");
                _strLgt = string_length(_code);
                i = _strCopy +string_length("B0"+string(_fe));
            }
            else{ //es variable
                if (_ve != -1){ //existe
                    
                    _code = string_replace(_code, _val1, valId[_ve]);
                    _strLgt = string_length(_code);
                    i = _strCopy +string_length(valId[_ve]);
                }
                else{ //noExiste
                    valId[valTot] = "A"+string(valTot);
                    valNa[valTot] = _val1; 
                    
                    _code = string_replace(_code, _val1, valId[valTot]);
                    _strLgt = string_length(_code);
                    i = _strCopy +string_length(valId[valTot]);
                    
                    valTot++;  
                }
            }
            _strCopy = -1;
        }
    }
}

//quitar espacios
var 
_inStr = false,
_strLgt = string_length(_code);

for (var i = 1; i <= _strLgt; i++){
    var _ord = string_ord_at(_code, i);
    
    //dentro de un string
    if _ord = 34{
        if !_inStr _inStr = true;
        else _inStr = false;
    }
    
    if _inStr continue;
    
    if _ord = ord(" "){
        _code = string_delete(_code, i, 1);
        _strLgt = string_length(_code);
        i--;
    }
}

//Arreglar positivos y negativos
var
_strLgt = string_length(_code);

for (var i = 1; i <= _strLgt; i++){
    var _ord = string_ord_at(_code, i); //- 45; + 43
    if (_ord = 45){ //-
        var _ord = string_ord_at(_code, i+1);
        if (_ord = 45){ //-
            _code = string_replace(_code, string_copy(_code, i, 2), "+");
            _strLgt = string_length(_code); i--;
        }
        else if (_ord = 43){ //+
            _code = string_replace(_code, string_copy(_code, i, 2), "-");
            _strLgt = string_length(_code); i--;
        }
    }
    else if (_ord = 43){ //+
        var _ord = string_ord_at(_code, i+1);
        if (_ord = 45){ //-
            _code = string_replace(_code, string_copy(_code, i, 2), "-");
            _strLgt = string_length(_code); i--;
        }
        else if (_ord = 43){ //+
            _code = string_replace(_code, string_copy(_code, i, 2), "+");
            _strLgt = string_length(_code); i--;
        }
    }
}

//reemplazar los negativos con \(92)
for (var i = 1; i <= _strLgt; i++){
    var _ord = string_ord_at(_code, i);
    if (_ord = 45){ //- 
        var _ord = string_ord_at(_code, i-1);
        
        if (_ord = 61) or (_ord = 42) or (_ord = 47) or (_ord = 40){ //=, *, /, (
            _code = string_delete(_code, i, 1);
            _code = string_insert("\", _code, i);
        }
    }
}

//soporte para +=
for (var i = 1; i <= _strLgt; i++){
    var _ord = string_ord_at(_code, i);
    if (_ord = 61){ //=
        var _ord = string_ord_at(_code, i-1);
        
        if (_ord = 42) or (_ord = 47) or (_ord = 43) or (_ord = 45){//*, /, +, -
        
            //leer la primera variable
            for (var j = 0; j <= _strLgt; j++){
                var _ord2 = string_ord_at(_code, j);
                
                if (_ord2 = 65){ //A (variable)
                    j++;
                    _strCopy = j;
                    while(scr_isNumber(string_ord_at(_code, j+1))){
                        j++;
                    }
                    _val1 = string_copy(_code, _strCopy, j-_strCopy+1);
                    break;
                }
            }
            
            //insertar
            if _val1 != ""{
                _code = string_delete(_code, i-1, 1); //eliminar a izquierda
                _code = string_insert(_val1 + string(chr(_ord)), _code, i); //insertar a derecha
            }
            break;
        }
    }
}

//registrar inicio y final de llaves
for (var i = 1; i <= _strLgt; i++){
    var _ord = string_ord_at(_code, i);
    
    //inicio {123 
    if (_ord = 123){ 
        linKey[nLinKey, 0] = argument0;
        linKey[nLinKey, 1] = -1;
        
        //while
        //show_message("CODIGO -1:#" + cCode[argument0-1]);
        if string_count("B2", cCode[argument0-1]){
            //show_message("WHILE EN:#" + string(nLinKey));
            linKey[nLinKey, 2] = 1;
        }
        else{
            linKey[nLinKey, 2] = 0;
        }
        nLinKey += 1;
    }
    
    //final }125
    else if (_ord = 125){
        var _minus = 1;
        while linKey[nLinKey -_minus, 1] != -1{
            _minus ++;
        }
        linKey[nLinKey -_minus, 1] = argument0;
    }
}






cCode[argument0] = _code;

