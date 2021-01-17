function SetSprite(spr){
	if sprite_index != spr {
		image_index = 0;
		sprite_index = spr;
		return true;
	}
	return false;
}