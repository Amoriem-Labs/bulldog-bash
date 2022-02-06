// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function KeyboardInput() {
	with p1 {
		playerKeyboardInput();
	}
	with p2 {
		playerKeyboardInput();
	}
}

function tryChangeState(newState) {
	if (state == STATE_FREE) {
		state = newState;
	}
}

function playerKeyboardInput() {
	if (kcp(punch) && checkCanAttack()) {
		tryChangeState(STATE_PUNCH);
		if (distance_to_object(opponent) <= PUNCH_RADIUS) {
			HandleAttack(punch);
		}
	} else if (kcp(kick) && checkCanAttack()) {
		tryChangeState(STATE_KICK);
		if (distance_to_object(opponent) <= KICK_RADIUS) {
			HandleAttack(kick);
		}
	} else if (kcp(block) && checkCanAttack()) {
		tryChangeState(STATE_BLOCK);
	} else if (kcp(spclAtk) && checkCanAttack()) {
		if (distance_to_object(opponent) <= SPCL_RADIUS) {
			HandleAttack(spclAtk);
		}
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