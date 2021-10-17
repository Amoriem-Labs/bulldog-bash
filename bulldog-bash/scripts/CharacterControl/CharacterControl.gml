function CharacterControl(){
	switch (state) {
		case STATE_FREE:
			// free state; all movement is possible
			if (kc(right) || kc(left)) {
				phy_speed_x = WALK_SPD*(kc(right) - kc(left));
			}
			break;
	}
	
	image_xscale = (opponent.x > x) ? 1: -1;
}
