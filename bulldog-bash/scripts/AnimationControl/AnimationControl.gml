function AnimationControl(){
	switch (state) {
		case STATE_FREE:
			if hspd == 0
				sprite_index = sp_idle;
			else
				sprite_index = (sign (hspd) == sign (image_xscale)) ? sp_forward:sp_backward;
			break;
	}
}