function HandleSprites(char) {
	switch (char) {
		case CHAR_CHUN:
			sp_idle = chun_idle;
			sp_fwd = chun_walk_forward;
			sp_bwd = chun_walk_backward;
			sp_block = chun_block;
			sp_jump_fwd = chun_jump_forward;
			sp_jump_bwd = chun_jump_backward;
			
			// attacks
			sp_atk = [chun_punch, chun_kick];
			sp_atk_air = [chun_jump_punch, chun_jump_kick];
		break

		// add in Pete Salovey
		case CHAR_PETE:
			sp_idle = spr_test_rect_2;
			sp_fwd = spr_test_rect_2;
			sp_bwd = spr_test_rect_2;
			sp_block = spr_test_rect_2;
			sp_jump_fwd = spr_test_rect_2;
			sp_jump_bwd = spr_test_rect_2;
			
			// attacks
			sp_atk = spr_test_rect_2;
			sp_atk_air = spr_test_rect_2;
		break
	}

	sprite_index = sp_idle;
}