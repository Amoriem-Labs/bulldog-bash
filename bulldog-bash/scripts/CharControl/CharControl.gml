function CharControl(){
	switch (state) {
		case STATE_FREE:
			can_atk = true;
			
			
			// if character on ground
			if landed {
				// if character not blocking, walk
				if !block {
					hspd = WALK_SPD * (keyboard_check(right) - keyboard_check(left));
				}	
				
				// jump
				if (keyboard_check_pressed(up)) {
					vspd = JUMP_FORCE;
					landed = false;
				}
				
				// block
			block = keyboard_check(down);	
			}
			// else in the air
			else {
				// allow control over jump
				if keyboard_check(right) or keyboard_check(left) {
					hspd = WALK_SPD * (keyboard_check(right) - keyboard_check(left));
				}
				else {
					hspd = 0;
				}
			}
			
			// attacks
			if keyboard_check_pressed(p1) {
				SetAtk(ATK_P1); break;
			} 
			else if keyboard_check_pressed(k1) {
				SetAtk(ATK_K1); break;
			}
		break;
		
		case STATE_ATK:
			if landed {
				hspd = 0;
			}
			// get back to free state
			if AnimEnd() {
				state = STATE_FREE;
			}
		break;
	}
	
	if landed {
		image_xscale = (opponent.x > x) ? 1 : -1;
	}
}
