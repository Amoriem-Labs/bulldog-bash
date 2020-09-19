/// @description Movement and Jump
// You can write your code in this editor


if (!place_meeting(x, y + 1, obj_floor))
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

key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);

hspeed = (key_right - key_left) * horizontal_speed;



