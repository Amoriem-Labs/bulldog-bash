anim_started = false;

function AnimationControl(){
	switch (state) {
		case STATE_FREE:
			// check for attacking anims. Need to change to allow animations to follow through state changes
			if kc(punch)
				// sprite_index = sp_punch;
				state = STATE_PUNCH;
			else if kc(kick)
				//sprite_index = sp_kick;
				state = STATE_KICK;
			else if kc(block)
				//sprite_index = sp_block;
				state = STATE_BLOCK

			// check for movement anims
			else if phy_speed_y > 0
				sprite_index = sp_jump;
			else if phy_speed_x == 0
				sprite_index = sp_idle;
			else
				sprite_index = (sign (phy_speed_x) == sign (image_xscale)) ? sp_forward:sp_backward;
			break;
			
		case STATE_PUNCH:
			
	}
}


