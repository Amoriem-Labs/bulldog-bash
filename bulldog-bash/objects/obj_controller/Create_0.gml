// player spawn

p1 = instance_create_layer(room_width/2 - STARTING_DISTANCE/2, 900, "Instances", obj_player);
p2 = instance_create_layer(room_width/2 + STARTING_DISTANCE/2, 900, "Instances", obj_player);
p2.image_xscale = -1;
p2.controller = CONT_P2;

p1.healthBar = instance_create_layer(187, 135, "Interfaces", obj_healthBar);
p1.healthBar.owner = p1;
p1.healthBar.xscaling = 1;
p2.healthBar = instance_create_layer(1179, 135, "Interfaces", obj_healthBar);
p2.healthBar.owner = p2;
p2.healthBar.xscaling = -1;

//setting opponents
p1.opponent = p2;
p2.opponent = p1;

//set player sprites
p1.character = CHAR_CHUN;
p2.character = CHAR_SALOVEY;

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
	punch = ord ("R");
	kick = ord ("T");
	spclAtk = ord ("Y");
	block = ord ("C");
}
	
with p2
{
	HandleSprites(character);
	left = vk_left;
	right = vk_right;
	up = vk_up;
	down = vk_down;
	punch = ord ("N");
	kick = ord ("M");
	spclAtk = ord (">");
	block = ord ("<");
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

//all useless jumpbase shit
/*jump = false;
jump_base_y = camera_get_view_y(view_camera[0]);
jump_base_x = camera_get_view_x(view_camera[0]);
new_jump_y = jump_base_y;*/