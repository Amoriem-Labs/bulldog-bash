function CharacterControl(){
	switch (state) {
		case STATE_FREE:
			// free state; all movement is possible
			if (kc(right) || kc(left)) {
				phy_speed_x = WALK_SPD*(kc(right) - kc(left));
			}
			if (kcp(up) && (grounded || jumps_left > 0)) {
				just_jumped = true;
				jumps_left -= 1;
				phy_speed_y = JUMP_FORCE*(kc(up));
			}
			if (kcp(down)) {
				phy_speed_y = FALL_COEF*distance_to_object(obj_floor)*(kc(down));
			}
			break;
	}
	image_xscale = (opponent.x > x) ? 1: -1;
}
