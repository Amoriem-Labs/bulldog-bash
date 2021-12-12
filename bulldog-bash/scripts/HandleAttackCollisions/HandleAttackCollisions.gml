
function HandleAttackCollisions(){
	player_attacked = (controller == CONT_P1) ? 2 : 1;
	
	switch (state) {
		case STATE_FREE:
		break;
		case STATE_PUNCH:
		lose_health(PUNCH_DMG, player_attacked);
		break;
	}
}

