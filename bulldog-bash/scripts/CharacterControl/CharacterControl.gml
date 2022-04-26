function CharacterControl(){
	if frozen {
		return
	}
	if(stunned > 0){
		stunned -= 1;
		if(stunned == 0){
			setAnimationState(STATE_FREE);
		}
		return;
	}
	if (canMove) {
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
	}
	
	if (canAttack) {
		var atk_keypress_registered = true;
		if (kcp(punch)) {
			setAnimationState(STATE_PUNCH);
			/*if (distance_to_object(opponent) <= PUNCH_RADIUS) {
				handleSuccessfulAttack(punch);
			}*/
		} else if (kcp(kick)) {
			setAnimationState(STATE_KICK);
			/*if (distance_to_object(opponent) <= KICK_RADIUS) {
				handleSuccessfulAttack(kick);
			}*/
		} else if (kcp(block)) {
			setAnimationState(STATE_BLOCK);
		} else if (kcp(spclAtk)) {
			if (specialCooldown == 0) {
				setAnimationState(STATE_SPECIAL);
				if (character == CHAR_SALOVEY) {
					ScheduleTask(function() {
						audio_play_sound(special_salovey, 1, false);
					}, 400);
					// Book is just a garden-variety attack, but with a delay!
					/*ScheduleTask(function () {
						if (distance_to_object(opponent) <= SPCL_SALOVEY_RADIUS) {
							audio_play_sound(hurt, 1, false);
							handleSuccessfulAttack(spclAtk);
						}
					}, 800);*/
					specialCooldown = SALOVEY_SPCL_COOLDOWN;
					// TODO: SFX
				} else if (character == CHAR_CHUN) {
					// Fire the projectile
					// The projectile will then check for collisions with its own hitbox
					audio_play_sound(special_chun, 1, false);
					/*with (instance_create_layer(x, y - 150, "Instances", obj_chun_projectile)) {
						var flavor = choose(1, 2, 3);
						switch (flavor) {
							case 1:
								audio_play_sound(nopeace, 1, false);
								sprite_index = spr_chunproj_nopeace;
							break;
							case 2:
								audio_play_sound(overcome, 1, false);
								sprite_index = spr_chunproj_overcome;
							break;
							case 3:
								audio_play_sound(renouncegod, 1, false);
								sprite_index = spr_chunproj_renouncegod;
							break;
						}
						dir = (other.opponent.x > x) ? 1 : -1;
						origin = other;
					}*/
					specialCooldown = CHUN_SPCL_COOLDOWN;
				}
			}
		} else {
			atk_keypress_registered = false;
		}
		if (atk_keypress_registered) {
			beginAttackCooldown();
			beginMoveCooldown();
		}
	}
	
	if (specialCooldown > 0) {
		specialCooldown --;
	}
	if (kc(up) && jumps_left <= 0 && fuel > 0) {
		phy_speed_y = FLY_SPEED;
		fuel -= FUEL_DRAIN;
		state = STATE_FLY;
	} else if (!kc(up)) {
		if (kcr(up)) {
			state = STATE_FREE;
		}
		if (fuel < MAX_FUEL) {
			fuel += FUEL_REGEN;
		}
	}
	
	image_xscale = (opponent.x > x) ? 1: -1;
}

function setAnimationState(newState) {
	state = newState;
	image_index = 0;
}

function beginAttackCooldown() {
	// Disable attacks during cooldown
	canAttack = false;
	// Set a timer for GLOBAL_ATTACK_COOLDOWN milliseconds
	// When the timer ends, reenable attacks
	ScheduleTask(function() {
		canAttack = true;
	}, GLOBAL_ATTACK_COOLDOWN);
}

function beginMoveCooldown() {
	// Disable movement for a brief duration
	canMove = false;
	//show_debug_message("canMove = " + string(canMove));
	// Set a timer to reenable movement after 50 milliseconds
	ScheduleTask(function() {
		canMove = true;
	}, GLOBAL_MOVE_COOLDOWN);
}

function handleSuccessfulAttack(attack) {
	switch (attack) {
		case punch:
			with opponent {
				LoseHealth(PUNCH_DMG);
			}
		break;
		case kick:
			with opponent {
				LoseHealth(KICK_DMG);
			}	
		break;
		case spclAtk:
			if (character == CHAR_SALOVEY) {
				with opponent {
					LoseHealth(SPCL_SALOVEY_DMG);
				}
			} else if (character == CHAR_CHUN) {
				with opponent {
					LoseHealth(SPCL_CHUN_DMG);
				}
			}
		break;
	}
	if (opponent.myHealth <= 0) {
		quotes = global.round_win_quotes[character]
		quote = quotes[irandom(array_length(quotes) - 1)];
		audio_play_sound(quote, 1, false);
		frozen = true
		opponent.frozen = true
		ScheduleTask(function() {
			win_counter += 1;
			if win_counter < 2 {
				ResetChar(ownSelf);
				ResetChar(opponent);
			}
		}, audio_sound_length(quote)*1000 + 400);
		
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
	