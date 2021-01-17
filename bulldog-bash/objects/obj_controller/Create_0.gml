/// @description Spawn Players

// spawning the players
p1 = instance_create_layer(room_width / 2 - 200, 250, "Instances", obj_player);
p2 = instance_create_layer(room_width / 2 + 200, 250, "Instances", obj_player);
p2.image_xscale = -1;
p2.controller = CONT_P2;

// set opponents
p1.opponent = p2;
p2.opponent = p1;

// set sprite for characters
p1.character = CHAR_CHUN;
p2.character = CHAR_PETE;

// update sprites
with p1
	HandleSprites(character);
	
with p2
	HandleSprites(character);