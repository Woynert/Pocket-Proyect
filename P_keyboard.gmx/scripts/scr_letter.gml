#define scr_letter
///scr_letter();

var _n = 0;

switch(menu){
    case 0: //Alfabeto
        key[_n] = "1"; //first row
        _n++; key[_n] = "2";
        _n++; key[_n] = "3";
        _n++; key[_n] = "4";
        _n++; key[_n] = "5";
        _n++; key[_n] = "6";
        _n++; key[_n] = "7";
        _n++; key[_n] = "8";
        _n++; key[_n] = "9";
        _n++; key[_n] = "0";
            
        switch(mayus){
            case 0:
                _n++; key[_n] = "q"; //first row
                _n++; key[_n] = "w";
                _n++; key[_n] = "e";
                _n++; key[_n] = "r";
                _n++; key[_n] = "t";
                _n++; key[_n] = "y";
                _n++; key[_n] = "u";
                _n++; key[_n] = "i";
                _n++; key[_n] = "o";
                _n++; key[_n] = "p";
                
                _n++; key[_n] = "a"; //second row
                _n++; key[_n] = "s";
                _n++; key[_n] = "d";
                _n++; key[_n] = "f";
                _n++; key[_n] = "g";
                _n++; key[_n] = "h";
                _n++; key[_n] = "j";
                _n++; key[_n] = "k";
                _n++; key[_n] = "l";
                _n++; key[_n] = "ñ";
                
                _n++; key[_n] = "z"; //third row
                _n++; key[_n] = "x";
                _n++; key[_n] = "c";
                _n++; key[_n] = "v";
                _n++; key[_n] = "b";
                _n++; key[_n] = "n";
                _n++; key[_n] = "m";
            break;
            case 1: case 2:
                _n++; key[_n] = "Q"; //first row
                _n++; key[_n] = "W";
                _n++; key[_n] = "E";
                _n++; key[_n] = "R";
                _n++; key[_n] = "T";
                _n++; key[_n] = "Y";
                _n++; key[_n] = "U";
                _n++; key[_n] = "I";
                _n++; key[_n] = "O";
                _n++; key[_n] = "P";
                
                _n++; key[_n] = "A"; //second row
                _n++; key[_n] = "S";
                _n++; key[_n] = "D";
                _n++; key[_n] = "F";
                _n++; key[_n] = "G";
                _n++; key[_n] = "H";
                _n++; key[_n] = "J";
                _n++; key[_n] = "K";
                _n++; key[_n] = "L";
                _n++; key[_n] = "Ñ";
                
                _n++; key[_n] = "Z"; //third row
                _n++; key[_n] = "X";
                _n++; key[_n] = "C";
                _n++; key[_n] = "V";
                _n++; key[_n] = "B";
                _n++; key[_n] = "N";
                _n++; key[_n] = "M";
            break;
        }
        
        _n++; key[_n] = ","; //fourth row
        _n++; key[_n] = "."; 
        _n++; key[_n] = ""; 
    break;
    
    case 1: //Numericos
        //first row
        key[_n] = "[";
        _n++; key[_n] = "]";
        _n++; key[_n] = "{";
        _n++; key[_n] = "}";
        _n++; key[_n] = "<";
        _n++; key[_n] = ">";
        _n++; key[_n] = ";";
        _n++; key[_n] = "¿";
        _n++; key[_n] = "¡";
        _n++; key[_n] = "^";
        
        _n++; key[_n] = "1";
        _n++; key[_n] = "2";
        _n++; key[_n] = "3";
        _n++; key[_n] = "4";
        _n++; key[_n] = "5";
        _n++; key[_n] = "6";
        _n++; key[_n] = "7";
        _n++; key[_n] = "8";
        _n++; key[_n] = "9";
        _n++; key[_n] = "0";
        
        _n++; key[_n] = "@"; //second row
        _n++; key[_n] = "\#";
        _n++; key[_n] = "$";
        _n++; key[_n] = "&";
        _n++; key[_n] = "_";
        _n++; key[_n] = "-";
        _n++; key[_n] = "(";
        _n++; key[_n] = ")";
        _n++; key[_n] = "=";
        _n++; key[_n] = "%";
        
        _n++; key[_n] = '"'; //third row
        _n++; key[_n] = "*";
        _n++; key[_n] = "'";
        _n++; key[_n] = ":";
        _n++; key[_n] = "/";
        _n++; key[_n] = "!";
        _n++; key[_n] = "?";
        _n++; key[_n] = "+"; 
        
        _n++; key[_n] = ","; //fourth row
        _n++; key[_n] = "."; 
    break;
}



#define script1
