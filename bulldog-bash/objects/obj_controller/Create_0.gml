// player spawn

p1 = instance_create_layer(room_width/2 - 100, 260, "Instances", obj_player);
p2 = instance_create_layer(room_width/2 + 100, 260, "Instances", obj_player);
p2.image_xscale = -1;
p2.controller = CONT_P2;

//setting opponents
p1.opponent = p2;
p2.opponent = p1;

//set player sprites
p1.character = CHAR_CHUN;
p2.character = CHAR_SALOVEY;

// Create a global list of tasks to run
schedule = ds_list_create();

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
