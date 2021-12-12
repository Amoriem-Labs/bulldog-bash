
/*function OldHandleAttackCollisions(){
	player_attacked = (controller == CONT_P1) ? 2 : 1;
	
	switch (state) {
		case STATE_FREE:
		break;
		case STATE_PUNCH:
		LoseHealth(PUNCH_DMG, player_attacked);
		break;
	}
}*/

function HandleAttack(attack) {
	switch (attack) {
		case punch:
			with opponent LoseHealth(PUNCH_DMG);
		break;
		case kick:
			with opponent LoseHealth(KICK_DMG);
		break;
	}
}