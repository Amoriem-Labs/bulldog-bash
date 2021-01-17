key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check_pressed(ord("W"));

hspeed = (key_right - key_left) * horizontal_speed;

 if (!place_meeting(x, y+vspeed, obj_floor))
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

// moving forward animation, change sprite
if (hspeed > 0) {
	// image_speed = hspeed / 6;
	sprite_index = chun_walk_forward;
}

// moving backward animation, change sprite
else if (hspeed < 0) {
	// image_speed = hspeed / 6;
	sprite_index = chun_walk_backward;
}

// idle, not moving
else {
	sprite_index = chun_idle;
}

// collision check
if (place_meeting(x+hspeed,y,obj_player2)) {
	x = x - hspeed;
}

if (place_meeting(x-hspeed,y,obj_player2)) {
	x = x + hspeed;
}

if (place_meeting(x,y+vspeed,obj_player2)) {
	gravity = 0;
    vspeed = 0;
}

// if (keyAtkPunch) state = PLAYERSTATE.ATK_PUNCH
// if (keyAtkKick) state = PLAYERSTATE.ATK_KICK