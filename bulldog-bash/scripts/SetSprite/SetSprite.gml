// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SetSprite(spr){
	if sprite_index != spr {
		image_index = 0;
		sprite_index = spr;
		return true;
	}
	return false;
}