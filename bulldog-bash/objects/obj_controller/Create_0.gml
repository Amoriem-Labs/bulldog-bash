/// @description Insert description here
// for pause menu: set this room persistent
//room_persistent = true;

// player spawn

randomize()

p1 = instance_create_layer(room_width/2 - STARTING_DISTANCE/2, 900, "Instances", obj_player);
p2 = instance_create_layer(room_width/2 + STARTING_DISTANCE/2, 900, "Instances", obj_player);
p2.image_xscale = -1;
p2.controller = CONT_P2;

// I haven't figured out how to instantiate these while using them above
// If you change the first two lines change these ones too!!!!!!!!!!
p1.startX = room_width/2 - STARTING_DISTANCE/2;
p2.startX = room_width/2 + STARTING_DISTANCE/2;
p1.startY = 900;
p2.startY = 900;

p1.healthBar = instance_create_layer(187, 135, "Interfaces", obj_healthBar);
p1.healthBar.owner = p1;
p1.healthBar.xscaling = 1;
p2.healthBar = instance_create_layer(1179, 135, "Interfaces", obj_healthBar);
p2.healthBar.owner = p2;
p2.healthBar.xscaling = -1;

game_ended = false

p1.win_counter = 0;
p2.win_counter = 0;

//setting opponents
p1.ownSelf = p1;
p1.opponent = p2;
p2.ownSelf = p2;
p2.opponent = p1;

show_debug_message("created controller!")

//set player sprites
p1.character = global.p1_char;
p2.character = global.p2_char;

global.round_win_quotes =
[
	[snd_ratio, duck, overcome],
	[okboomer, basement_victory, welcome]
];

bgm_choices = [roma_1, roma_3, roma_5, roma_6, roma_7]

bgm_choice = bgm_choices[irandom(array_length(bgm_choices) - 1)]

alarm_set(1, audio_sound_length(bgm_choice)*room_speed);

bgm = audio_play_sound(bgm_choice, 0, true);

// Whether the game is paused
paused = false;

// Create a global list of tasks to run
global.schedule = ds_list_create();

//cam = instance_create_layer(0, 0, "Instances", obj_camera);

with p1
{
	HandleSprites(character);
	left = ord ("A");
	right = ord ("D");
	up = ord ("W");
	down = ord ("S");
	punch = ord ("E");
	kick = ord ("R");
	spclAtk = ord ("Q");
	block = ord ("X");
	pause_key = vk_escape;
}
	
with p2
{
	HandleSprites(character);
	left = vk_left;
	right = vk_right;
	up = vk_up;
	down = vk_down;
	punch = 190; //.
	kick = 188; //,
	spclAtk = ord("K"); 
	block = ord ("L");
	pause_key = ord ("P");
}

globalvar cam;
cam = instance_create_layer(room_width/2, room_height/2, "Interfaces", obj_camera);
fixed_dist = STARTING_DISTANCE;

final_x = 0;
final_y = 0;
final_x_dist = 0;
final_y_dist = 0;

x_q = ds_queue_create();
y_q = ds_queue_create();
x_dist_q = ds_queue_create();
y_dist_q = ds_queue_create();
//enqueue 20 empty elems
for(i=0; i<10; i++) {
	ds_queue_enqueue(x_q, 0);
	ds_queue_enqueue(y_q, 0);
	ds_queue_enqueue(x_dist_q, 0);
	ds_queue_enqueue(y_dist_q, 0);
}
gap = true;

//testing camera boundary stuff, corners for debugging
/*edge_x =0;
edge_y = 0;
edge_xdist = 0;
edge_ydist = 0;*/

//all useless jumpbase shit
/*jump = false;
jump_base_y = camera_get_view_y(view_camera[0]);
jump_base_x = camera_get_view_x(view_camera[0]);
new_jump_y = jump_base_y;*/
