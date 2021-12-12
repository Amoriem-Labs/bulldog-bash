/// @description Draw a fraction of the health bar

if (activated) {
	/*draw_sprite_part(sprite_index, 1, 
		sprite_width - sprite_width*(global.right_player_health/100), 0, 
		sprite_width*(global.right_player_health/100), sprite_height, 
		x + (sprite_width - sprite_width*(global.right_player_health/100)), y);*/
	draw_sprite_part_ext(sprite_index, 1,
		sprite_width - sprite_width*(global.right_player_health/100), 0,
		sprite_width*(global.right_player_health/100), sprite_height, 
		obj_battle_UI.ohr_x + obj_battle_UI.ratio * (sprite_width - sprite_width*(global.right_player_health/100)),
		obj_battle_UI.ohl_y, obj_battle_UI.ratio, obj_battle_UI.ratio, c_white, 1);
} else {
	/*draw_sprite_part(sprite_index, 0, 
		sprite_width - sprite_width*(global.right_player_health/100), 0, 
		sprite_width*(global.right_player_health/100), sprite_height, 
		x + (sprite_width - sprite_width*(global.right_player_health/100)), y);*/
	draw_sprite_part_ext(sprite_index, 0,
		sprite_width - sprite_width*(global.right_player_health/100), 0,
		sprite_width*(global.right_player_health/100), sprite_height, 
		obj_battle_UI.ohr_x + obj_battle_UI.ratio * (sprite_width - sprite_width*(global.right_player_health/100)),
		obj_battle_UI.ohl_y, obj_battle_UI.ratio, obj_battle_UI.ratio, c_white, 1);
}

