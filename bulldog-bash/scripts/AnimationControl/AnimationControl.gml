function AnimationControl(){
	switch (state) {
		case STATE_FREE:
			if hspeed == 0
				sprite_index = sp_idle;
			else
				sprite_index = (sign (hspeed) == sign (image_xscale)) ? sp_forward:sp_backward;
			break;
	}
}