/// @description Insert description here
// You can write your code in this editor

//camera_set_view_border(view_camera[0], room_width/8, room_height);
//camera_set_view_target(view_camera[0], global.camera);
//Idea 1: can make an object that stays in the middle between two chars and cam object focusing on it
//Idea 2: make a cam that calculates stuff based off of chars directly


camera_set_view_pos(view_camera[0], newx, newy) //y needs to change
camera_set_view_size(view_camera[0], x_dist, y_dist); //y needs to change

//show_debug_message(x_dist);

//Setting obj_battle_UI directly so no jiggly effect.
//potential problem of putting it here is that when making other cam, obj_battle_UI needs to be disabled to avoid showing up
obj_battle_UI.x = newx;
obj_battle_UI.y = newy;
ratio = (x_dist / obj_battle_UI.og_image_width);
obj_battle_UI.ratio = ratio;
obj_battle_UI.image_xscale = ratio;
obj_battle_UI.image_yscale = ratio;
