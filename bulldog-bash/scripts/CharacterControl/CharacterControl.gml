function CharacterControl(){
	switch (state) {
		case STATE_FREE:
			// free state; all movement is possible
			if (fdash == true) { //hostage other commands, prio dash
				if(character == CHAR_CHUN) {
					Dash(3.6, 2, fdash); //Kevin's god code so no need to check reverse
				}
				if(character == CHAR_SALOVEY) {
					Dash(3.6, 2, bdash);
				}
			}
			else if (bdash == true) {
				if(character == CHAR_CHUN) {
					Dash(-3.6, 2, bdash);
				}
				if(character == CHAR_SALOVEY) {
					Dash(-3.6, 2, fdash);
				}
			}
			
			else {	
				//movement
				if (kc(right) || kc(left)) {
					phy_speed_x = WALK_SPD*(kc(right) - kc(left));
				}
				if (kcp(up) && (grounded || jumps_left > 0)) {
					just_jumped = true;
					jumps_left -= 1;
					phy_speed_y = JUMP_FORCE*(kc(up));
				}
				if (kcp(down)) {
					phy_speed_y = FALL_COEF*distance_to_object(obj_floor)*(kc(down));
				}

			}
			//break;
			//we want fallthrough here so the below runs for all states
		default:
			//attacks
			if (kcp(punch) && checkCanAttack()) {
				tryChangeState(STATE_PUNCH);
				if (distance_to_object(opponent) <= PUNCH_RADIUS) {
					handleSuccessfulAttack(punch);
				}
			} else if (kcp(kick) && checkCanAttack()) {
				tryChangeState(STATE_KICK);
				if (distance_to_object(opponent) <= KICK_RADIUS) {
					handleSuccessfulAttack(kick);
				}
			} else if (kcp(block) && checkCanAttack()) {
				tryChangeState(STATE_BLOCK);
			} else if (kcp(spclAtk) && checkCanAttack()) {
				if (distance_to_object(opponent) <= SPCL_RADIUS) {
					handleSuccessfulAttack(spclAtk);
				}
			}
			// enable jetpack
			if(kc(fly)) {
				if(character == CHAR_CHUN) {
					phy_speed_y = FLY_SPEED;
				}
				if(character == CHAR_SALOVEY) {
					phy_speed_y = FLY_SPEED;
				}
				//state = STATE_FLY;
				}
			break;
	}
	image_xscale = (opponent.x > x) ? 1: -1;
}

function tryChangeState(newState) {
	if (state == STATE_FREE) {
		state = newState;
	}
}

function checkCanAttack() {
	if (canAttack) {
		canAttack = false;
		ScheduleTask(function() {
			canAttack = true;
		}, GLOBAL_ATTACK_COOLDOWN);
		return true;
	}
	return false;
}

function handleSuccessfulAttack(attack) {
	switch (attack) {
		case punch:
			with opponent LoseHealth(PUNCH_DMG);
		break;
		case kick:
			with opponent LoseHealth(KICK_DMG);
		break;
	}
}

//-----------------------------FOR DASHING--------------------------------//
function Dash(mult, ind, dash) {
	if(floor(image_index) != image_number-1) {
		variable_global_set(dash, true);
		if(floor(image_index) >= ind) { //in air after first ind frames
			phy_speed_x = WALK_SPD*mult; //this is the air speed
			createShadow();
		}
		else {
			phy_speed_x = 0; //don't move when charging leap
		}
	}
	else {
		fdash = false;
		bdash = false; //might not need, but safety so set both to f
		phy_speed_x = 0; //stops char
	}
}

function createShadow() {
	shadow = instance_create_depth(x, y, depth, obj_shadow); //attempting to add shadow
	shadow.image_xscale = shadow.image_xscale*sign(image_xscale);
	shadow.char = id;
	shadow.image_index = floor(image_index);
	shadow.sprite_index = sprite_index; //initializing the first shadow
}
	
//-----------------------------FOR DASHING--------------------------------//	
	