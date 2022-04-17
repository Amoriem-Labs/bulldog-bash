/// @description Insert description here
// You can write your code in this editor
//don't need instances of this cuz only 1
//UI width is 640
//Room width is 1992
//gonna do top left so easier to suit cam stuff

og_image_width = sprite_width;
ratio = 0;

//Name/protrait on the UI should spawn depending on the char that the player picked
//p1 = left, p2 = right. Don't forget to flip!


//just in case of two people pick the same/diff char
switch (global.p1_char) {
	case CHAR_CHUN:
		p1char = spr_chun_char;
		p1name = spr_chun_name;
		break;
	case CHAR_SALOVEY:
		p1char = spr_salovey_char;
		p1name = spr_salovey_name;
		break;
}

switch (global.p2_char) {
	case CHAR_CHUN:
		p2char = spr_chun_char;
		p2name = spr_chun_name;
		break;
	case CHAR_SALOVEY:
		p2char = spr_salovey_char;
		p2name = spr_salovey_name;
		break;
}