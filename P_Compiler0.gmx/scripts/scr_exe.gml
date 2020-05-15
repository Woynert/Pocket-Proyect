#define scr_exe
///scr_exe(code[n]);

var
_code = argument0,
_strCopy = -1,
_val1 = "",
_val2 = "",
_strLgt = string_length(_code),

_act = 0,
_actInf = 0;

/*  Acciones
    //0 = sostener variable
    1 = declarar variable
*/

for (var j = 1; j <= _strLgt; j++){
    _ord = string_ord_at(_code, j);
    
    //A (variable)
    if (_ord = 65){ 
        //leer id
        j++;
        _strCopy = j;
        while(scr_isNumber(string_ord_at(_code, j+1))){
            j++;
        }
        _val1 = string_copy(_code, _strCopy, j-_strCopy+1);
        _act = 1;
        
        //leer otro lado despues del igual
        j += 2;
        _strCopy = j;
        _val2 = string_copy(_code, j, _strLgt-j+1);
        
        //declarar variable
        /*show_message(string_ord_at(_code, j))
        show_message(string_ord_at(_code, _strLgt))
        show_message(string_ord_at(_code, j) = 34 and string_ord_at(_code, _strLgt) = 34)
        if string_ord_at(_code, j) = 34 and string_ord_at(_code, _strLgt) = 34{
            show_message("Val String: "+string(val[real(_val1)]));
            val[real(_val1)] = scr_recPa(_val2); //string_replace_all(_val2, '"', ""); 
            show_message("Val String: "+val[real(_val1)]);
        }
        else{
            show_message("Val Number: "+string(val[real(_val1)]));
            val[real(_val1)] = real(scr_recPa(_val2));
            show_message("Val Number: "+string(val[real(_val1)]));
        }*/
        
        _val2 = scr_recPa(_val2);
        if scr_isNumber(string_ord_at(_val2, 1))
            val[real(_val1)] = real(scr_recPa(_val2));
        else 
            val[real(_val1)] = scr_recPa(_val2);
        
        //terminar trabajo
        exit;
    }
    
    //B (función)
    else if (_ord = 66){ 
        //leer id
        j++;
        _strCopy = j;
        while(scr_isNumber(string_ord_at(_code, j+1))){
            j++;
        }
        _val1 = string_copy(_code, _strCopy, j-_strCopy+1);
        //show_message(_val1);
        switch(real(_val1)){
            case 0: case 2: //if //while
            
                //leer otro lado despues del igual
                j += 2;
                _strCopy = j;
                _val2 = string_copy(_code, j, _strLgt-j+1);
                
                //falso: Saltarse el codigo
                if !(real(scr_recPa(_val2))){
                
                    //hay llaves 
                    if string_count("{", cCode[Im+1]){ 
                        Im = scr_findLineKeyStt(Im+1);
                        /*var _Im = 2, 
                        _kc = string_count("}", cCode[Im+_Im]), 
                        _ko = false; 
                        
                        //encontrar la llave correspodiente
                        while(!(_kc and !_ko)){
                            if string_count("{", cCode[Im+_Im])
                                _ko = true;
                            else if _kc
                                _ko = false;
                                
                            _Im ++;
                            _kc = string_count("}", cCode[Im+_Im]);
                        }
                        Im += _Im;
                        */
                        //no ejecutar el else
                        if string_count("B1", cCode[Im+1]){
                            Im += 2;
                        }
                    }
                    
                    //no hay llaves
                    else{ 
                        Im += 2;
                    }
                }
            break;
            case 1: //else
            
                /*/hay llaves
                if string_count("{", cCode[Im+1]){
                    var _Im = 2, 
                    _kc = string_count("}", cCode[Im+_Im]), 
                    _ko = false; 
                    
                    //encontrar la llave correspodiente
                    while(!(_kc and !_ko)){
                        if string_count("{", cCode[Im+_Im])
                            _ko = true;
                        else if _kc
                            _ko = false;
                            
                        _Im ++;
                        _kc = string_count("}", cCode[Im+_Im]);
                    }
                    Im += _Im;
                }
                
                //no hay llaves
                else{ 
                    Im += 2;
                }
                ifN--;*/
            break;
            /*case 2: //while
                
            break;*/
        }
    }
    
    //} (llave cerrada)
    else if (_ord = 125){ 
        var _Im = scr_findLineKeyEnd(Im);
        if (_Im){
            if (linKey[scr_findLineKeySttCycle(_Im), 2]){
                Im = _Im-2; //Llevarlo antes del while para que se alcance ejecute
            }
        }
    }
}


#define scr_findLineKeyStt
///scr_findLineKeyStt(val)

var _stt = argument0;

for(var i = 0; i < array_height_2d(linKey); i++){

    //found
    if (linKey[i, 0] = _stt){
        return(linKey[i, 1])
        break;
    }
}
return(false);

#define scr_findLineKeyEnd
///scr_findLineKeyEnd(val)

var _end = argument0;

for(var i = 0; i < array_height_2d(linKey); i++){

    //found
    if (linKey[i, 1] = _end){
        return(linKey[i, 0])
        break;
    }
}
return(false);

#define scr_findLineKeySttCycle
///scr_findLineKeySttCycle(val)

var _stt = argument0;

for(var i = 0; i < array_height_2d(linKey); i++){

    //found
    if (linKey[i, 0] = _stt){
        return(i)
        break;
    }
}
return(false);
