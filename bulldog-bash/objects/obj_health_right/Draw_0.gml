/// @description Draw a fraction of the health bar

draw_sprite_part(sprite_index, 1, 
		sprite_width - sprite_width*((global.right_player_health + health_lost)/100), 0, 
		sprite_width*((global.right_player_health + health_lost)/100), sprite_height, 
		x + (sprite_width - sprite_width*((global.right_player_health + health_lost)/100)), y);
if (activated) {
	draw_sprite_part(sprite_index, 1, 
		sprite_width - sprite_width*(global.right_player_health/100), 0, 
		sprite_width*(global.right_player_health/100), sprite_height, 
		x + (sprite_width - sprite_width*(global.right_player_health/100)), y);
} else {
	draw_sprite_part(sprite_index, 0, 
		sprite_width - sprite_width*(global.right_player_health/100), 0, 
		sprite_width*(global.right_player_health/100), sprite_height, 
		x + (sprite_width - sprite_width*(global.right_player_health/100)), y);
}