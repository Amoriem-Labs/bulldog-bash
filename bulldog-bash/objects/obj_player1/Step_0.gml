/// @description Movement and Jump
// You can write your code in this editor

// apply gravity to sprite if in air
if (!place_meeting(x, y, obj_floor))
{
	gravity = grv;
}
else
{
   gravity = 0;
   vspeed = 0;
   
   if(keyboard_check_pressed(vk_space) || keyboard_check(ord("W")))
	{
		vspeed = jump_power;
	}
}

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));

hspeed = (key_right - key_left) * horizontal_speed;



