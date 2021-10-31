function CharacterControl(){
	switch (state) {
		case STATE_FREE:
			// free state; all movement is possible
			if (kc(right) || kc(left)) {
				phy_speed_x = WALK_SPD*(kc(right) - kc(left));
			}
			if (kcp(up) && (grounded || jumps_left > 0)) {
				show_debug_message("just jumped: " + string(just_jumped));
				just_jumped = true;
				jumps_left -= 1;
				show_debug_message(jumps_left);
				phy_speed_y = JUMP_FORCE*(kc(up));
			}
			if (kcp(down)) {
				phy_speed_y -= JUMP_FORCE*(kc(down));
			}
			break;
	}
	image_xscale = (opponent.x > x) ? 1: -1;
}
