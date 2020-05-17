#define scr_click
///scr_click( x1, y1, x2, y2)

if (mouse_check_button_pressed(mb_left)){
    if (point_in_rectangle(mouse_x, mouse_y, argument0, argument1, argument2, argument3)){
        return(true);
    }
    else{
        return(false);
    }
}


#define script2
///scr_clickLetter( x1, y1, x2, y2)

if (mouse_check_button_pressed(mb_left)){
    if (point_in_rectangle(mouse_x, mouse_y, argument0, argument1, argument2, argument3)){
        return(true);
    }
    else{
        return("");
    }
}