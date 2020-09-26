/// @description Insert description here
// You can write your code in this editor

p1_hp = 100;
p2_hp = 100;
max_hp = 100;

h_centre = surface_get_width(application_surface) / 2;
h_offset = 95;
v_offset = 92;
topbar_spr_width = sprite_get_width(spr_topbar_green_right);
topbar_spr_height = sprite_get_height(spr_topbar_green_right);

draw_sprite(spr_topbar, 0, h_centre, 0);

masked = surface_create( topbar_spr_width, topbar_spr_height );

surface_set_target( masked );
draw_sprite( spr_topbar_green_left, 0, 0, 0 );
surface_reset_target();

draw_surface_part(masked, 0, 0, p1_hp / max_hp * topbar_spr_width, topbar_spr_height, h_centre - h_offset - topbar_spr_width, v_offset);

masked = surface_create( topbar_spr_width, topbar_spr_height );

surface_set_target( masked );
draw_sprite( spr_topbar_green_right, 0, 0, 0 );
surface_reset_target();

draw_surface_part(masked, topbar_spr_width - p2_hp / max_hp * topbar_spr_width, 0, p2_hp / max_hp * topbar_spr_width, topbar_spr_height, h_centre + h_offset, v_offset);