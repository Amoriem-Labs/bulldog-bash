/// @description Insert description here
// You can write your code in this editor

draw_self(); //so the interface is not invis!

//tune those values to change representations!
draw_sprite_ext(p1char, 0, x + 16*ratio, y + 16*ratio, ratio, ratio, 0, c_white, 1);
draw_sprite_ext(p1name, 0, x + 146*ratio, y + 32*ratio, ratio*0.7, ratio*0.7, 0, c_white, 1);

draw_sprite_ext(p2char, 0, x + 1264*ratio, y + 16*ratio, -ratio, ratio, 0, c_white, 1);
draw_sprite_ext(p2name, 0, x + 872*ratio, y + 36*ratio, ratio*0.7, ratio*0.7, 0, c_white, 1); //one thing noticible, 32 v 36, artistic choices...

//if statement might be simpler but this feels more efficient and cooler ;D
switch (obj_controller.p1.win_counter) {
	case 1:
		draw_sprite_ext(spr_win_counter, 0, x + 531*ratio, y + 175*ratio, ratio*0.9, ratio*0.9, 0, c_white, 1);
		break;
	case 2:
		draw_sprite_ext(spr_win_counter, 0, x + 531*ratio, y + 175*ratio, ratio*0.9, ratio*0.9, 0, c_white, 1);
		draw_sprite_ext(spr_win_counter, 0, x + 463*ratio, y + 175*ratio, ratio*0.9, ratio*0.9, 0, c_white, 1);
		break;
}
switch (obj_controller.p2.win_counter) {
	case 1:
		draw_sprite_ext(spr_win_counter, 0, x + 747*ratio, y + 175*ratio, ratio*0.9, ratio*0.9, 0, c_white, 1);
		break;
	case 2:
		draw_sprite_ext(spr_win_counter, 0, x + 747*ratio, y + 175*ratio, ratio*0.9, ratio*0.9, 0, c_white, 1);
		draw_sprite_ext(spr_win_counter, 0, x + 815*ratio, y + 175*ratio, ratio*0.9, ratio*0.9, 0, c_white, 1);
		break;
}
