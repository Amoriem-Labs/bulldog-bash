/// @description Insert description here
// You can write your code in this editor

draw_sprite(topbar, 0, h_centre, 0);


draw_sprite(portrait1, 0, h_centre - portrait_h_offset, portrait_v_offset);
draw_sprite_ext(portrait2, 0, h_centre + portrait_h_offset, portrait_v_offset, -1, 1, 0, c_white, 1);

draw_text(h_centre, 70, string(int64(game_time / room_speed)));

if (game_time > 0) {
	game_time--;
}

masked = surface_create( topbar_width, topbar_height );

surface_set_target( masked );
draw_sprite( topbar_green_left, 0, 0, 0 );
surface_reset_target();

draw_surface_part(masked, 0, 0, p1_hp / max_hp * topbar_width, topbar_height, h_centre - h_offset - topbar_width, v_offset);

masked = surface_create( topbar_width, topbar_height );

surface_set_target( masked );
draw_sprite( topbar_green_right, 0, 0, 0 );
surface_reset_target();

draw_surface_part(masked, topbar_width - p2_hp / max_hp * topbar_width, 0, p2_hp / max_hp * topbar_width, topbar_height, h_centre + h_offset, v_offset);