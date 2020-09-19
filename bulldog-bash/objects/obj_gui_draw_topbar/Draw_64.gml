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

draw_sprite(spr_topbar_green_left, 0, h_centre - h_offset, v_offset);
draw_sprite_ext(spr_topbar_green_left, 0, h_centre - h_offset + h_other, v_offset, stretch, 1, 0, c_white, 1);


/*
surface_set_target(masked);

draw_clear_alpha(c_black,0); //Clear

draw_set_blend_mode(bm_normal);
draw_surface(splatsurf,0,0);

draw_set_blend_mode_ext(bm_normal,bm_src_alpha); //Blend
draw_surface(wallsurf,0,0);

surface_reset_target();

draw_set_blend_mode(bm_normal);
draw_surface(masked,0,0);*/

