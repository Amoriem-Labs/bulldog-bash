// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CharControl(){
	switch (state) {
		case STATE_FREE:
			hspd = WALK_SPD * (keyboard_check(right) - keyboard_check(left));
		break;
	}
	
	image_xscale = (opponent.x > x) ? 1 : -1;
}