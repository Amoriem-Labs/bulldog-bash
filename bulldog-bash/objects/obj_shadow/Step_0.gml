image_index = floor(char.image_index);
sprite_index = char.sprite_index;
time -= 1;
image_alpha -= 0.1;	//opacity works with shadow timer

if time == 0 {
	instance_destroy();
}