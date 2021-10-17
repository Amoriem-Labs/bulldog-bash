function AnimationControl(){
	switch (state) {
		case STATE_FREE:
			if phy_speed_x == 0
				sprite_index = sp_idle;
			else
				sprite_index = (sign (phy_speed_x) == sign (image_xscale)) ? sp_forward:sp_backward;
			break;
	}
}