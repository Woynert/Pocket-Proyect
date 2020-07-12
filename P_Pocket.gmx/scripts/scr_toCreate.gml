#define scr_toCreate
///scr_toCreate(_id, _type, _name);

var
_id = argument0,
_type = argument1,
_obj;

switch(_type){
    case -1: _obj = obj_folder break;
    case 0: _obj = obj_sprite break;
    case 1: _obj = obj_sound break;
    case 2: _obj = obj_background break;
    case 3: _obj = obj_script break;
    case 4: _obj = obj_font break;
    case 5: _obj = obj_objects break;
    case 6: _obj = obj_room break;
    default: _obj = obj_file; show_message("ERROR CREANDO FILE TYPE DEFAULT") break;
}

_id.file[_id.nFiles] = instance_create(0, 0, _obj);
with(_id.file[_id.nFiles]){
    switch(_type){
        case -1:{ //carpeta
            subType = _id.subType;
        }break;
        default:{ //obje
            type = _type;
        }break;
    }
    name = other.argument2;    
    padre = _id;
}
_id.nFiles += 1;
_id.open = true;






#define scr_formatName
///scr_formatName(id)

var _name = "";
switch(argument0){
    case -1: _name = "Folder" break;
    case 0: _name = "Sprite" break;
    case 1: _name = "Sound" break;
    case 2: _name = "Background" break;
    case 3: _name = "Script" break;
    case 4: _name = "Font" break;
    case 5: _name = "Object" break;
    case 6: _name = "Room" break;
}

return (_name);
#define scr_fileMove
///scr_fileMove(fileID, destino(folder), posición);

var
_id = argument0,
_destino = argument1,
_pos = argument2;

with(_destino){

    //correr todos una posicion adelante
    for(k = nFiles; k > _pos; k--){
        file[k] = file[k-1];
    }
    
    //reemplazar
    file[_pos] = _id;
    nFiles += 1;
    open = true;
}
_id.padre = _destino;

#define scr_filePos
///scr_filePos(fileID)

with (argument0.padre){

    //sacar la posición
    for(k = 0; k < nFiles; k++){ 
        if (file[k] = argument0){
            return(k);
            exit;
        }
    }
    return(0); //no se encontró
}