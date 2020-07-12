#define scr_ArbolDeRecursos
///scr_ArbolDeRecursos();

//Arbol de recursos
draw_set_color(c_white);
draw_set_font(fnt_1B);

_n = 0;
_subN = 0;
yM = 70
var _lastYM = yM;
for(i = 0; i <= 6; i++){

    yM += 20; //actualizar posicion
    
    if (i > 0){ //dibujar linea larga
        if (folder[i-1].open){
            draw_set_color(c_gray);
            draw_line(25 -13, yM+8-6, 25 -13, _lastYM+8+5);
        }
    }
    
    _lastYM = yM; //guardar posicion anterior
    
    draw_set_font(fnt_1B);
    if (i != 0){ //estado esquina
        scr_file(folder[i], 25, yM, 2);}
    else{
        scr_file(folder[i], 25, yM, 3);}
}

scr_ArbolDeRecursosTools(); //Herramientas

#define scr_ArbolDeRecursosTools
///scr_ArbolDeRecursosTools(); Acciones para el sistema de archivos

///Barra de herramientas
draw_set_color(c_white);
draw_set_font(fnt_1B);

var _nu = 0, _txt = "", _gr = 50;
draw_set_color(c_white);

if (selTreeJ != -1){
    if (selTreeJ.type = -1){ //carpeta
    
        if (selTreeJ.padre = noone){ //carpetas raiz
            _nu = 2; //newObject / newFolder
        }
        else{ //carpetas normales
            _nu = 5; //newObject / newFolder / rename / delete / move
        }
    
        //dibujar botones
        if (toEdit = 0){ 
            for(j = 0; j < _nu; j++){ 
                
                switch(j){ 
                    case 0: _txt = "New "+string_lower(scr_formatName(selTreeJ.subType)); break; //newObject
                    case 1: _txt = "New folder"; break; //newFolder
                    case 2: _txt = "Move"; break; //move
                    case 3: _txt = "Rename folder"; break; //rename
                    case 4: _txt = "Delete folder"; break; //delete
                }
                
                if scr_drawButton1(rw/_nu, _gr, j, _txt){
                    switch(j){
                        case 0:{ //newObject
                            toEdit = 1;
                            strEdit = scr_formatName(selTreeJ.subType);
                        }break;
                        case 1:{ //newFolder
                            toEdit = 2;
                            strEdit = "Folder";
                        }break;
                        case 2:{ //move
                            toEdit = 3;
                        }break;
                        case 3:{ //rename
                            toEdit = 4;
                            strEdit = selTreeJ.name;
                        }break;
                        case 4:{ //delete
                            toEdit = 5;
                        }break;
                    }
                }
            }  
        } 
        
        //accion
        else{ 
            switch(toEdit){
            
                //newFile / newFolder
                case 1: case 2:{ 
                    var _on = scr_textEditor( _gr);
                    if (_on = 1){ //cancelar
                        toEdit = 0;
                    }
                    else if (_on = 2){ //aceptar
                        switch(toEdit){
                            case 1: scr_toCreate(selTreeJ, selTreeJ.subType, strEdit); break; //newObject
                            case 2: scr_toCreate(selTreeJ, -1, strEdit); break; //newFolder
                        }
                        toEdit = 0;
                    }
                }break;
                
                //move
                case 3:{ 
                    if (toMove = -1){
                        toMove = selTreeJ;
                        selTreeI = selTreeJ;
                        //selTreeJ = -1;
                    }
                    else if (selTreeI != toMove) and ((selTreeI.type = -1 and selTreeI.subType = toMove.subType) or (selTreeI.type != -1 and selTreeI.type = toMove.subType)){ //se selecciona otro (destino)
                        
                        //que no sean familia
                        var _sub = selTreeI, _fam = false;
                        while(true){//repeat(100){
                            if (_sub.padre = noone){
                                break;
                            }
                            else if (_sub.padre != toMove){
                                _sub = _sub.padre;
                            }
                            else if (_sub.padre = toMove){
                                _fam = true;
                                break;
                            }
                        }
                    
                        if (_fam = true){
                            //Resetear indicadores
                            selTreeI = selTreeJ;
                        }
                        else{
                            //sacar posición
                            if (selTreeI.type != -1){ //archivo
                                var _pos = scr_filePos(selTreeI);
                            }
                        
                            //quitarlo de su padre
                            scr_fileDestroy(toMove, false);
                            
                            //se seleccionó un...
                            if (selTreeI.type = -1){ //carpeta
                                scr_fileMove(toMove, selTreeI, 0);
                            }
                            else{ //archivo
                                scr_fileMove(toMove, selTreeI.padre, _pos);
                            }
                            
                            //Resetear indicadores
                            toMove.open = false;
                            toMove = -1;
                            selTreeI = -1;
                            toEdit = 0;
                        }
                    }
                    
                    //dibujar boton cancelar
                    if scr_drawButton1(rw/1, _gr, 0, "Cancelar"){
                        //Resetear indicadores
                        toMove = -1;
                        selTreeI = -1;
                        toEdit = 0;
                    }
                    
                }break;
                
                //rename
                case 4:{ 
                    var _on = scr_textEditor( _gr);
                    if (_on = 1){ //cancelar
                        toEdit = 0;
                    }
                    else if (_on = 2){ //aceptar
                        selTreeJ.name = strEdit;
                        toEdit = 0;
                    }
                }break;
                case 5:{ //delete
                    scr_fileDestroy(selTreeJ, true);
                    selTreeJ = -1;//Resetear indicadores
                    toEdit = 0;
                }break;
            }
        } 
    }
    else{ //selTreeJ.type = loQueSea
        _nu = 5; //abrir / move / duplicate / rename / delete
        
        //dibujar botones
        if (toEdit = 0){ 
            for(j = 0; j < _nu; j++){ 
                
                switch(j){ 
                    case 0: _txt = "Open"; break; //open
                    case 1: _txt = "Move"; break; //move
                    case 2: _txt = "Duplicate"; break; //duplicate
                    case 3: _txt = "Rename"; break; //rename
                    case 4: _txt = "Delete"; break; //delete
                }
                
                if scr_drawButton1(rw/_nu, _gr, j, _txt){
                    switch(j){
                        case 0:{ //open
                            toEdit = 1;
                        }break;
                        case 1:{ //move
                            toEdit = 2;
                        }break;
                        case 2:{ //duplicate
                            toEdit = 3;
                        }break;
                        case 3:{ //rename
                            toEdit = 4;
                            strEdit = selTreeJ.name;
                        }break;;
                        case 4:{ //delete
                            toEdit = 5;
                        }break;
                    }
                }
            }  
        }
        
        //accion
        else{ 
            switch(toEdit){
            
                //open
                case 1:{ 
                    toEdit = 0;
                    scr_tareaAdd(selTreeJ, -1); //añadir
                    tareaSel = nTareas-1; //seleccionar
                }break;
                
                //move
                case 2:{ 
                    if (toMove = -1){
                        toMove = selTreeJ;
                        selTreeI = selTreeJ;
                        //selTreeJ = -1;
                    }
                    else if (selTreeI != toMove) and ((selTreeI.type = -1 and selTreeI.subType = toMove.type) or (selTreeI.type != -1 and selTreeI.type = toMove.type)){ //se selecciona otro (destino)
                        
                        //sacar posición
                        if (selTreeI.type != -1){ //archivo
                            var _pos = scr_filePos(selTreeI);
                        }
                    
                        //quitarlo de su padre
                        scr_fileDestroy(toMove, false);
                        
                        //se seleccionó un...
                        if (selTreeI.type = -1){ //carpeta
                            scr_fileMove(toMove, selTreeI, 0);
                        }
                        else{ //archivo
                            
                            scr_fileMove(toMove, selTreeI.padre, _pos);
                        }
                        
                        //Resetear indicadores
                        toMove = -1;
                        selTreeI = -1;
                        toEdit = 0;
                    }
                    
                    //dibujar boton cancelar
                    if scr_drawButton1(rw/1, _gr, 0, "Cancelar"){
                        //Resetear indicadores
                        toMove = -1;
                        selTreeI = -1;
                        toEdit = 0;
                    }
                    
                }break;
                
                //duplicate
                case 3:{ 
                    scr_fileDuplicate(selTreeJ);
                    toEdit = 0;
                }break;
                
                //rename
                case 4:{ 
                    var _on = scr_textEditor( _gr);
                    if (_on = 1){ //cancelar
                        toEdit = 0;
                    }
                    else if (_on = 2){ //aceptar
                        selTreeJ.name = strEdit;
                        toEdit = 0;
                    }
                }break;
                
                //delete
                case 5:{ 
                    scr_fileDestroy(selTreeJ, true);
                    selTreeJ = -1; //Resetear indicadores
                    toEdit = 0;
                }break;
            }
        }
    }
}