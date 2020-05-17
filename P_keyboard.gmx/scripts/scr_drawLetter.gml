#define scr_drawLetter
///scr_drawLetter(x, y, text);

var
_x = argument0,
_y = argument1,
_txt = argument2;

draw_text(_x +grK/2, _y +grH/2, _txt);


#define scr_drawLetterExt
///scr_drawLetterExt(x, y, text, grK, grH);

var
_x = argument0,
_y = argument1,
_txt = argument2,
_grK = argument3,
_grH = argument4;

draw_text(_x +_grK/2, _y +_grH/2, _txt);

#define scr_drawIcon
///scr_drawIcon(x, y, subImage, size, grK, grH);

var
_x = argument0,
_y = argument1,
_size = argument3,
_grK = argument4,
_grH = argument5;

draw_sprite_stretched(spr_icons, argument2, _x +_grK/2 -_size/2, _y +_grH/2 -_size/2, _size, _size);

#define scr_drawIconExt
/*//scr_drawIconExt(x, y, subImage, size, grK, grH);

var
_x = argument0,
_y = argument1,
_size = argument3,
_grK = argument4,
_grH = argument5,
_ang = argument6;

draw_sprite_stretched_ext(spr_icons, argument2, _x +_grK/2 -_size/2, _y +_grH/2 -_size/2, _size, _size, c_white, );


/*
if !place_meeting(x + 1, y, obj_keyboard){
    //caminar x += 1;
}
*/