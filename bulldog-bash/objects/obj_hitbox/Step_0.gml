/// @description Collision
// Should be collision event but for some reason won't trigger
var _inst = instance_place(x, y, obj_hurtbox);
if _inst != noone{
	if(!InArray(ignoreList, _inst.owner)){
		array_push(ignoreList, _inst.owner);
		with(_inst.owner){
			if(state == STATE_BLOCK){
				LoseHealth(other.damage * BLOCK_DMG_REDUCE);
			}
			else{
				LoseHealth(other.damage);
				if(other.hitStun > 0){
					setAnimationState(STATE_STUN);
					stunned = other.hitStun;
				}
			}
		}
		with(owner){
			if (opponent.myHealth <= 0) {
				quotes = global.round_win_quotes[character]
				quote = quotes[irandom(array_length(quotes) - 1)];
				audio_play_sound(quote, 1, false);
				frozen = true;
				opponent.frozen = true;
				instance_destroy(obj_chun_projectile);
				ScheduleTask(function() {
					win_counter += 1;
					if win_counter < 2 {
						ResetChar(ownSelf);
						ResetChar(opponent);
					}
				}, audio_sound_length(quote)*1000 + 400);
		
			}
		}
	}
}
