// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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
			
		break;
	}
	
	if landed {
		image_xscale = (opponent.x > x) ? 1 : -1;
	}
}