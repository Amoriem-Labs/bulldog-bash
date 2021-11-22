// player spawn

p1 = instance_create_layer(room_width/2 - STARTING_DISTANCE/2, 900, "Instances", obj_player);
p2 = instance_create_layer(room_width/2 + STARTING_DISTANCE/2, 900, "Instances", obj_player);
p2.image_xscale = -1;
p2.controller = CONT_P2;

//setting opponents
p1.opponent = p2;
p2.opponent = p1;

//set player sprites
p1.character = CHAR_CHUN;
p2.character = CHAR_SALOVEY;

//cam = instance_create_layer(0, 0, "Instances", obj_camera);

with p1
{
	HandleSprites(character);
	right = ord ("D");
	left = ord ("A");
	up = ord ("W");
	down = ord ("S");
}
	
with p2
{
	HandleSprites(character);
	right = vk_right;
	left = vk_left;
	up = vk_up;
	down = vk_down;
}


cam = instance_create_layer(room_width/2, room_height/2, "Instances", obj_camera);

//all useless jumpbase shit
/*jump = false;
jump_base_y = camera_get_view_y(view_camera[0]);
jump_base_x = camera_get_view_x(view_camera[0]);
new_jump_y = jump_base_y;*/