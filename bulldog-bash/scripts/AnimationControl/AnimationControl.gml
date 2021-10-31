function AnimationControl(){
	switch (state) {
		case STATE_FREE:
			// check for attacking anims
			if kc(punch)
				sprite_index = sp_punch;
			else if kc(kick)
				sprite_index = sp_kick;
			else if kc(block)
				sprite_index = sp_block;

			// check for movement anims
			else if phy_speed_y > 0
				sprite_index = sp_jump;
			else if phy_speed_x == 0
				sprite_index = sp_idle;
			else
				sprite_index = (sign (phy_speed_x) == sign (image_xscale)) ? sp_forward:sp_backward;
			break;
	}
}


