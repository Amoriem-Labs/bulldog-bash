/// @description Movement and Jump
// You can write your code in this editor


if (!place_meeting(x, y+vspeed, obj_floor))
{
	gravity = grv;
}
else
{
   gravity = 0;
   vspeed = 0;
}

key_right = keyboard_check(ord("L"));
key_left = keyboard_check(ord("J"));
key_up = keyboard_check_pressed(ord("I"));

hspeed = (key_right - key_left) * horizontal_speed;

// collision check
if (place_meeting(x+hspeed,y,obj_player1)) {
	x = x - hspeed;
}

if (place_meeting(x-hspeed,y,obj_player1)) {
	x = x + hspeed;
}

if (place_meeting(x,y+vspeed,obj_player1)) {
	gravity = 0;
    vspeed = 0;
}

// moving forward animation, change sprite
if (key_right) {
	image_speed = hspeed / 6;
	// sprite_index = spr_chun_walk_fw;
}

// moving backward animation, change sprite
if (key_left) {
	image_speed = hspeed / 6;
	// sprite_index = spr_chun_walk_bw;
}

if (key_up) {
	vspeed = jump_power;
}

// idle, not moving
if (keyboard_check(vk_nokey)) {
	image_speed = 0;
	image_index = 0;
}