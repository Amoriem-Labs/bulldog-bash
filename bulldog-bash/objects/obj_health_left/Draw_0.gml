/// @description Draw a fraction of the health bar

draw_sprite_part(sprite_index, 1, 0, 0, 
	sprite_width*((global.left_player_health + health_lost)/100), sprite_height, x, y);
if (activated) {
	draw_sprite_part(sprite_index, 1, 0, 0, 
		sprite_width*(global.left_player_health/100), sprite_height, x, y);
} else {
	draw_sprite_part(sprite_index, 0, 0, 0, 
		sprite_width*(global.left_player_health/100), sprite_height, x, y);
}