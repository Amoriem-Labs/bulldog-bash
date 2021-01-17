// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AnimationControl(){
	switch (state) {
		case STATE_FREE:
			// on ground
			if landed {
				// not blocking
				if !block {
					// if idle
					if (hspd == 0) {
						SetSprite(sp_idle);
					}
					// character is moving
					else {
						sprite_index = (sign(hspd) == sign(image_xscale)) ? sp_fwd : sp_bwd
					}
				}
				// block animation
				else {
					if !SetSprite(sp_block) {
						FreezeFrame()
					}
				}
			}
			// in air
			else {
				if hspd >= 0 {
					SetSprite(sp_jump_fwd)
				}
				else {
					SetSprite(sp_jump_bwd)
				}
			}
	}
}