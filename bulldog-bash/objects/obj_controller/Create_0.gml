// player spawn

p1 = instance_create_layer(room_width/2 - 100, 220, "Instances", obj_player);
p2 = instance_create_layer(room_width/2 + 100, 220, "Instances", obj_player);
p2.image_xscale = -1;
p2.controller = CONT_P2

//setting opponents
p1.opponent = p2;
p2.opponent = p1;

//set player sprites
p1.character = CHAR_CHUN;
p2.character = CHAR_SALOVEY;

//update sprites
//p1.sprite_index = spr_chun_idle;
//p2.sprite_index = spr_salovey_idle;

with p1
	HandleSprites(character);
	
with p2
	HandleSprites(character);
