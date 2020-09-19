/// @description Insert description here
// You can write your code in this editor
h_centre = surface_get_width(application_surface) / 2;
h_offset = 50;
v_offset = 50;

draw_sprite(spr_topbar, 0, h_centre, 0);

stretch = 1.0;
h_other = 0;
if (keyboard_check(vk_space) && stretch > 0) { 
	stretch -= .1;
	h_other -= sprite_get_width(spr_topbar_green_left) / 10;
	};

draw_sprite_ext(spr_topbar_green_left, 0, h_centre - h_offset + h_other, v_offset, stretch, 1, 0, c_white, 1);


