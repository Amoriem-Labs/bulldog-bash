// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AnimationControl(){
	switch (state) {
		case STATE_FREE:
			if (hspd == 0) {
				sprite_index = sp_idle;
			}
			else {
				sprite_index = (sign(hspd) == sign(image_xscale)) ? sp_fwd : sp_bwd
			}
	}
}