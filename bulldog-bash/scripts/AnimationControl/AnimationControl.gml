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
					/*
					if !SetSprite(sp_block) {
						FreezeFrame()
					}
					*/
					SetSprite(sp_block);
					hspd = 0;
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
		break;
		
		case STATE_ATK:
			// can't attack, exit state (for glitch purposes)
			if !can_atk {
				exit
			}
			if landed {
				SetSprite(sp_atk[atk_type])
			}
			else {
				SetSprite(sp_atk_air[atk_type])
			}
			can_atk = false;
		break;
	}
}