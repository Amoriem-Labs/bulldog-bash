/// @description Insert description here
// You can write your code in this editor

t ++;

x += dir * exp(t / 50);

//pull hitbox (only with certain hitboxes)
if (hitbox != noone){
	with(hitbox){
		x = other.x + xOffset;
		y = other.y + yOffset;
	}
}

/*
if (armed && distance_to_object(origin.opponent) == 0) {
	audio_play_sound(hurt, 1, false);
	with (origin) {
		handleSuccessfulAttack(spclAtk);
	}
	armed = false;
}
*/

//show_debug_message(string(distance_to_object(origin.opponent)));
