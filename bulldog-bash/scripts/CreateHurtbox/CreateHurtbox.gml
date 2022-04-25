// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateHurtbox(){
	var _hurtbox = instance_create_layer(x,y, "Instances",obj_hurtbox);
	_hurtbox.owner = id;
	_hurtbox.image_xscale = argument0;
	_hurtbox.image_yscale = argument1;
	_hurtbox.xOffset = argument2;
	_hurtbox.yOffset = argument3;
	
	return _hurtbox;
}