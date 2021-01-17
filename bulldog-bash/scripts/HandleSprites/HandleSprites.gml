function HandleSprites(char) {
	switch (char) {
		case CHAR_CHUN:
			sp_idle = chun_idle;
			sp_fwd = chun_walk_forward;
			sp_bwd = chun_walk_backward;
		break

		// add in Pete Salovey
		case CHAR_PETE:
			sp_idle = spr_test_rect_2;
			sp_fwd = spr_test_rect_2;
			sp_bwd = spr_test_rect_2;
		break
	}

	sprite_index = sp_idle;
}