/// @description Movement and Jump
// You can write your code in this editor


if (!place_meeting(x, y, obj_floor))
{
	gravity = grv;
}
else
{
   gravity = 0;
   vspeed = 0;
   
   if(keyboard_check_pressed(vk_space))
	{
		vspeed = jump_power;
	}
}

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check_pressed(ord("W"));

hspeed = (key_right - key_left) * horizontal_speed;

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