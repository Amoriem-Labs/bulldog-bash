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
			sp_idle = sal_idle;
			sp_fwd = sal_walk_forward;
			sp_bwd = sal_walk_backward;
			sp_block = sal_block;
			sp_jump_fwd = sal_idle;
			sp_jump_bwd = sal_idle;
			
			// attacks
			sp_atk = [sal_punch, sal_kick];
			sp_atk_air = [sal_punch, sal_kick];
		break
	}

	sprite_index = sp_idle;
}