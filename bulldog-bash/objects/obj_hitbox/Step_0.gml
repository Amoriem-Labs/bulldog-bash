/// @description Collision
// Should be collision event but for some reason won't trigger
var _inst = instance_place(x, y, obj_hurtbox);
if _inst != noone{
	if(!InArray(ignoreList, _inst.owner)){
		array_push(ignoreList, _inst.owner);
		with(_inst.owner){
			LoseHealth(other.damage);
		}
		with(owner){
			if (opponent.myHealth <= 0) {
				win_counter += 1;
				ResetChar(ownSelf);
				ResetChar(opponent);
			}
		}
	}
}
