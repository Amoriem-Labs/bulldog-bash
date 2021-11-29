/// @description Draw a fraction of the health bar

//disable this for now, else conflicts.. need to update draw function to fit scaling, YEP SCALING UPDATED !
if (activated) {
	/*draw_sprite_part(sprite_index, 1, 0, 0, 
		sprite_width*(global.left_player_health/100), sprite_height, x, y);*/
	draw_sprite_part_ext(sprite_index, 1, 0, 0, sprite_width*(global.left_player_health/100), sprite_height, 
		obj_battle_UI.ohl_x, obj_battle_UI.ohl_y, obj_battle_UI.ratio, obj_battle_UI.ratio, c_white, 1);
} else {
	/*draw_sprite_part(sprite_index, 0, 0, 0, 
		sprite_width*(global.left_player_health/100), sprite_height, x, y);*/
	draw_sprite_part_ext(sprite_index, 0, 0, 0, sprite_width*(global.left_player_health/100), sprite_height, 
		obj_battle_UI.ohl_x, obj_battle_UI.ohl_y, obj_battle_UI.ratio, obj_battle_UI.ratio, c_white, 1);
}



//draw_sprite(sprite_index, 0, x, y); I'M SO SAD BUT IM HAPPY CUZ ONLY 3 HOURS.... ALWAYS 400 BEFORE IF DOES THIS, THANK GOD STRETCHED!


