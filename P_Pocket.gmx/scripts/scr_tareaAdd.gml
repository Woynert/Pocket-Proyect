#define scr_tareaAdd
///scr_tareaAdd(fileID, menuID);

//comprobar si ya está
for(var j = 0; j < nTareas; j++){ //mover todo
    if (tarea[j, 0] = argument0){
        exit;
    }
}

//agregar
tarea[nTareas, 0] = argument0;
tarea[nTareas, 1] = argument1;

nTareas += 1; //sumar total

#define scr_tareaDelete
///scr_tareaDelete(tareaID);

//eliminar
tarea[argument0, 0] = -1;
tarea[argument0, 1] = -1;

for(var j = argument0; j < (nTareas-1); j++){ //mover todo
    tarea[j, 0] = tarea[j+1, 0];
    tarea[j, 1] = tarea[j+1, 1];
}

nTareas -= 1; //restar total
tareaSel = 0; //seleccionar arbol