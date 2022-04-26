// Variables

character = CHAR_CHUN;
controller = CONT_P1;

opponent = noone;

state = STATE_FREE;

frozen = false

stunned = 0;

// Controls whether a player is able to attack
canAttack = true;

// Controls whether a player can use their special
specialCooldown = 100;

// Controls whether a player can move
canMove = true;

// Player-specific instance variable for health
myHealth = 100;

// Hurtbox
hurtbox = CreateHurtbox(80,160,-40,-160); //width, height, xoffset, yoffset

// Hitbox to carry
hitbox = noone;

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

//-----------------------------FOR JETPACK--------------------------------//
isFlying = false;
fuel = MAX_FUEL;


