function AnimationControl(){
	switch (state) {
		case STATE_FREE:
			if kc(punch)
				sprite_index = sp_punch;
			else if kc(kick)
				sprite_index = sp_kick;
			else if kc(block)
				sprite_index = sp_block;
			else if hspd == 0
				sprite_index = sp_idle;
			else
				sprite_index = (sign (hspd) == sign (image_xscale)) ? sp_forward:sp_backward;
			break;
	}
}