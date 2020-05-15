#define scr_recPa
///scr_recPa(_str);

var
_str = argument0;
_nR = string_count("(", _str);

//numero de repeticiones
if (_nR > 0){

    repeat(_nR){
        var
        _opePa = 0,
        _cloPa = 0,
        _strLgt = string_length(_str),
        _open = 0;
        
        //start read
        for (var j = 1; j <= _strLgt; j++){
            if string_ord_at(_str, j) = 40{ //(
                _open = 1;
                _opePa = j;    
            }
        }
        
        //end read
        if (_open = 1){
            for (var j = _opePa; j <= _strLgt; j++){
                if string_ord_at(_str, j) = 41{ //)
                    _open = 2;
                    _cloPa = j;
                    break;
                }
            }
        }
        
        //return
        if (_open = 2){
            var _str2 = ""+scr_recCap(string_copy(_str, _opePa+1, _cloPa-_opePa-1));
            _str = string_delete(_str, _opePa, _cloPa-_opePa+1);
            _str = string_insert(_str2, _str, _opePa);
            
            if (string_count("(", _str) = 0){
                _open = 0;
            }
            //continue;
        }
        if (_open = 0){ //si no hay parentesis
            return(scr_recCap(_str));
        }
    }
}
else{ //si no hay parentesis
    var a = scr_recCap(_str)
    return(a);
}



#define scr_recCap
///scr_recCap(_str)

var _str = argument0;

//reemplazar variables
var _strCopy = -1,
_val1 = "",
_val2 = "",
_strLgt = string_length(_str);

for (var j = 1; j <= _strLgt; j++){
    var _ord = string_ord_at(_str, j);
    
    if (_ord = 65){ //A (variable)
        j++;
        _strCopy = j;
        while(scr_isNumber(string_ord_at(_str, j+1))){
            j++;
        }
        _val1 = string_copy(_str, _strCopy, j-_strCopy+1);
        _val2 = val[real(_val1)];
        //show_message("Valores a reemplazar#_val1:" + string(_val1) + "#_val2: "+string(_val2)) //MESSAGE MESSAGE MESSAGE
        _str = string_replace(_str, "A"+_val1, string(_val2));
        j = _strCopy +string_length(string(_val2))-1;
    }
}
//en este punto ya no deberian haber letras en el string


//arreglar negativos y positivos
var _chr = 45;
repeat(2){
    for (var j = 1; j <= _strLgt; j++){
    
        var _ord = string_ord_at(_str, j); //- 45; + 43
        if (_ord = _chr){
        
            _ord = string_ord_at(_str, j-1);
            if (!scr_isNumber(_ord) and !(_ord = 34)){ //No es numero Ni "(34)
            
                _str = string_delete(_str, j, 1);
                
                if (_chr = 45){
                    _str = string_insert("\", _str, j);
                }
            }
        }
    }   
    _chr = 43;
}

//Arreglar \s
_str = scr_fixNeg(_str);

//multiplicacion
if (string_count("*", _str) > 0){
    _str = scr_rec(_str, 3, "*"); //show_message(_str);
}

//division
if (string_count("/", _str) > 0){
    _str = scr_rec(_str, 2, "/"); //show_message(_str);
} 

//suma
if (string_count("+", _str) > 0){
    _str = scr_rec(_str, 1, "+"); //show_message(_str);
} 

//resta
if (string_count("-", _str) > 0){
    _str = scr_rec(_str, 0, "-"); //show_message(_str);
}

//OPERACIONES LOGICAS

//and
if (string_count("&&", _str) > 0){
    _str = scr_rec(_str, 4, "&&");
}

//or
if (string_count("||", _str) > 0){
    _str = scr_rec(_str, 5, "||");
}

//igual
if (string_count("=", _str) > 0){
    _str = scr_rec(_str, 6, "=");
}

//mayor que
if (string_count(">", _str) > 0){
    _str = scr_rec(_str, 7, ">");
}

//menor que
if (string_count("<", _str) > 0){
    _str = scr_rec(_str, 8, "<");
}

//arreglar negativo (cuidado)
if (string_count("\", _str) > 0){
    _str = string_replace(_str, "\", "-");
} 


return(_str);

#define scr_rec
///scr_rec(string, id, char)

var
_str = argument0,
_id = argument1,
_strLgt = string_length(_str),
_strCopy = -1,
_sv1 = 0,
_sv2 = 0,
_val1 = 0,
_val2 = 0,
_char = argument2, //_char = "",
_exit = false;

/*

0 = resta
1 = suma
2 = division
3 = multiplicacion

*/

//operar
if string_count(_char, _str) > 0{
    for (var j = 1; j <= _strLgt; j++){
    
        var _ord = string_ord_at(_str, j);
        
        if (_ord = ord(_char)){ //operacion 
            
            var _isStr = (string_ord_at(_str, j -1) = 34);
            //valor de la izquierda
            for (var k = 0; k <= _strLgt; k++){
            
                var _ordJk = string_ord_at(_str, j -k);
                
                //start read
                if scr_isNumber(_ordJk) or _ordJk = 34{ 
                    if (_strCopy = -1){
                        _strCopy = j -k;
                    }
                }
                else if (j-k < 1){ //no se encontró
                    _exit = true;
                    break;
                }
                
                //end read
                if (_strCopy != -1){
                
                    //number
                    if (!scr_isNumber(_ordJk) and !_isStr){ 
                        _sv1 = string_copy(_str, j-k+1, _strCopy -(j-k));
                        _strCopy = -1;
                        //show_message("_sv1: " + string(_sv1)+ " : "+string(k));
                        break;
                    }
                    
                    //string
                    else if (_ordJk = 34 and k != 1){ 
                        k++;
                        _sv1 = string_copy(_str, j-k+1, _strCopy -(j-k));
                        _strCopy = -1;
                        //show_message("_sv1: " + string(_sv1)+ " : "+string(k));
                        break;
                    }
                    
                    //caso especial
                    else if (j-k = 1){ 
                        _sv1 = string_copy(_str, j-k, _strCopy -(j-k)+1);
                        _strCopy = -1;
                        //show_message("_sv2: " + string(_sv2));
                        break;
                    }
                }
            }
            if (_exit) break;
            
            //valor de la derecha
            for (var k = 0; k <= _strLgt; k++){
            
                var _ordJk = string_ord_at(_str, j +k);
                
                //start read
                if scr_isNumber(_ordJk) or _ordJk = 34{
                    if (_strCopy = -1){
                        _strCopy = j+k;
                    }
                }
                
                //end read
                //number
                if (!scr_isNumber(_ordJk) and !_isStr){ 
                    if (_strCopy != -1){
                        _sv2 = string_copy(_str, _strCopy, j+k-_strCopy);
                        _strCopy = -1; 
                        break;
                    }
                }
                
                //string
                else if (_ordJk = 34 and k != 1){ 
                    k++;
                    _sv2 = string_copy(_str, _strCopy, j+k-_strCopy);
                    _strCopy = -1;
                    //show_message("_sv2: " + string(_sv2)+ " : "+string(k));
                    break;
                }
            }
            
            //show_message("Valores a operar#sv1: "+string(_sv1)+"#sv2: "+string(_sv2)) //MESSAGE MESSAGE MESSAGE
            if scr_isNumber(string_ord_at(_sv1, 1)){
                //arreglar negativos
                if (string_count("\", _sv1) > 0){
                    _val1 = real(string_replace(_sv1, "\", "-"));
                }
                else{
                    _val1 = real(_sv1); 
                }
                
                if (string_count("\", _sv2) > 0){
                    _val2 = real(string_replace(_sv2, "\", "-"));
                }
                else{
                    _val2 = real(_sv2);
                }
                
                //return
                switch(_id){
                    case 3: _val1 = string(real(_val1)*real(_val2)); break; //multiplicacion
                    case 2: _val1 = string(real(_val1)/real(_val2)); break; //divis1on
                    case 1: _val1 = string(real(_val1)+real(_val2)); break; //suma
                    case 0: _val1 = string(real(_val1)-real(_val2)); break; //resta
                    case 4: _val1 = string(real(_val1)&&real(_val2)); break; //and
                    case 5: _val1 = string(real(_val1)||real(_val2)); break; //or
                    case 6: _val1 = string(real(_val1)=real(_val2)); break; //igual
                    case 7: _val1 = string(real(_val1)>real(_val2)); break; //mayorque
                    case 8: _val1 = string(real(_val1)<real(_val2)); break; //menorque
                }
                
                //arreglar negativos
                if string_count("-", _val1) > 0{
                    _val1 = string_replace(_val1, "-", "\");
                } 
                
            }
            else{ //strings
                
                //arreglar comillas
                var
                __sv1 = string_copy(_sv1, 2, string_length(_sv1)-2),
                __sv2 = string_copy(_sv2, 2, string_length(_sv2)-2);
                
                //show_message("M6#sv1: "+string(__sv1)+"#sv2: "+string(__sv2)) //MESSAGE MESSAGE MESSAGE
            
                //return
                switch(_id){
                    case 1: _val1 = '"' + string(__sv1+__sv2) + '"'; break; //suma
                    case 6: _val1 = string(__sv1=__sv2); break; //igual
                    case 7: _val1 = string(__sv1>__sv2); break; //mayorque
                    case 8: _val1 = string(__sv1<__sv2); break; //menorque
                }
            }
            
            //return
            _str = string_replace(_str, _sv1+_char+_sv2, _val1);
            
            if string_count(_char, _str) > 0 and string_char_at(_str, 1) != _char{ //"-" //if (string_count(_char, _str) > 0 and _char != "-") or (_char = "-" and string_char_at(_str, 1) != "-"){ 
                _strCopy = -1; _strLgt = string_length(_str); j = 1;
            }
            else{
                _str = scr_fixNeg(_str);
                return(_str);
                exit;
            }
        }
    }
}
_str = scr_fixNeg(_str);
return(_str);

#define scr_fixNeg
///scr_arreglarNeg(_str);

var 
_s = argument0;

//Arreglar \s
if string_count("\", _s) > 0{
    _s = string_replace_all(_s, "\-", "+");
    _s = string_replace_all(_s, "-\", "+");
    _s = string_replace_all(_s, "+\", "-");
    _s = string_replace_all(_s, "\+", "-");
    _s = string_replace_all(_s, "\\",  "");    
}

return (_s);
