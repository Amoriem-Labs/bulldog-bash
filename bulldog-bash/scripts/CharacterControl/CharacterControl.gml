function CharacterControl(){
	switch (state) {
		case STATE_FREE:
			// free state; all movement is possible
			speed = WALK_SPD*(kc(right) - kc(left));
			show_debug_message("Right = " + string(right) + " speed" + string (speed));
			break;
	}
	
	image_xscale = (opponent.x > x) ? 1: -1;
}
