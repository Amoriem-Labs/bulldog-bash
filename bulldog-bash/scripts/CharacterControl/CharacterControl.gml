function CharacterControl(){
	switch (state) {
		case STATE_FREE:
			// free state; all movement is possible
			if (fdash == true) { //hostage other commands, prio dash
				if(character == CHAR_CHUN) {
					Dash(1.2, 2, fdash); //Kevin's god code so no need to check reverse
				}
				if(character == CHAR_SALOVEY) {
					Dash(1.2, 2, bdash);
				}
			}
			else if (bdash == true) {
				if(character == CHAR_CHUN) {
					Dash(-1.2, 2, bdash);
				}
				if(character == CHAR_SALOVEY) {
					Dash(-1.2, 2, fdash);
				}
			}
			else {	
				if (kc(right) || kc(left)) {
					phy_speed_x = WALK_SPD*(kc(right) - kc(left));
				}
				if (kcp(up)) {
					phy_speed_y = JUMP_FORCE*(kc(up));
				}
				if (kcp(down)) {
					phy_speed_y -= JUMP_FORCE*(kc(down));
				}
				break;
			}
	}
	image_xscale = (opponent.x > x) ? 1: -1;
	
}

//-----------------------------FOR DASHING--------------------------------//
function Dash(mult, ind, dash) {
	if(floor(image_index) != image_number-1) {
		variable_global_set(dash, true);
		if(floor(image_index) >= ind) { //in air after first ind frames
			phy_speed_x = WALK_SPD*mult; //this is the air speed
		}
		else {
			phy_speed_x = 0; //don't move when charging leap
		}
	}
	else {
		fdash = false;
		bdash = false; //might not need, but safety so set both to f
		phy_speed_x = 0; //stops char
	}
}
//-----------------------------FOR DASHING--------------------------------//	
	