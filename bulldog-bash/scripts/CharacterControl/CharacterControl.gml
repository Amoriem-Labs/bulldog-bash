function CharacterControl(){
	switch (state) {
		case STATE_FREE:
			// free state; all movement is possible
			hspd = WALK_SPD*(kc(right) - kc(left));
			break;
	}
	
	image_xscale = (opponent.x > x) ? 1: -1;
}