///scr_fileDestroy(fileID, destroy?);

with(argument0){
    with(padre){
        var _i = 0;
        for(k = 0; k < nFiles; k++){ //buscar la posicion
            if (file[k] = other.id){
                _i = k;
                break;
            }
        }
        for(k = _i; k < (nFiles-1); k++){ //correr todos una posicion atras
            file[k] = file[k+1];
        }
        
        file[nFiles] = noone; //eliminar restante
        nFiles -= 1; //disminuir en uno el total
    }
    
    //destruirlo
    if (other.argument1){
        instance_destroy(); 
    }
}

