// player spawn

p1 = instance_create_layer(room_width/2 - 100, 260, "Instances", obj_player);
p2 = instance_create_layer(room_width/2 + 100, 260, "Instances", obj_player);
p2.image_xscale = -1;
p2.controller = CONT_P2

//setting opponents
p1.opponent = p2;
p2.opponent = p1;

//set player sprites
p1.character = CHAR_CHUN;
p2.character = CHAR_SALOVEY;


with p1
	HandleSprites(character);
	
with p2
	HandleSprites(character);
