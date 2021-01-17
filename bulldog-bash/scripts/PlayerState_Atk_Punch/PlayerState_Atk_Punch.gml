hspeed = 0;
vspeed = 0;

// start of punch

if (sprite_index != chun/chun_punch)
{
	sprite_index = chun/chun_punch;
	image_index = 0;
	ds_list_clear(hitByAtk);
}

// use attack hitbox and check for hits