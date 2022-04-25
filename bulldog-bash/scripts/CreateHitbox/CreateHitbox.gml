// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateHitbox(){
	_hitbox = instance_create_layer(x,y,"Instances",obj_hitbox);
	_hitbox.owner = id;
	_hitbox.image_xscale = argument0;
	_hitbox.image_yscale = argument1;
	_hitbox.xOffset = argument2;
	_hitbox.yOffset = argument3;
//	_hitbox.life = argument4; irrelevant
//	_hitbox.xHit = argument5; knockback
	_hitbox.damage = argument5;
	_hitbox.hitStun = argument6;
	with (_hitbox){
		alarm[0] = argument4;
		array_push(ignoreList, other);
	}

return _hitbox;
}