// Variables

character = CHAR_CHUN;
controller = CONT_P1;

opponent = noone;

state = STATE_FREE;

// Controls whether a player is able to attack
canAttack = true;

// Player-specific instance variable for health
myHealth = 100;

win_counter = 0;

//-----------------------------FOR DASHING--------------------------------//
dashReset();
fdash = false; //rightward dashing movements (sorry for bad naming)
bdash = false; //leftward dashing movements

//-----------------------------FOR DASHING--------------------------------//
grounded = false;
jumps_left = 0;
just_jumped = false;

//this makes char over interfaces layer, which has a depth of 0
depth = -100;
//also change floor depth so char is over floor ;DDDD

function createProjectile(xpos, ypos, xscale) {
	proj = instance_create_layer(x+xpos, y+ypos, 0, obj_projectile);
	with (proj) {
		speed = 10;
		direction = image_angle;
		image_xscale = xscale;
	}
}
	