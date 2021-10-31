// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateCenterObject(p1, p2){
	obj = instance_create_layer(0, 0, "Instances", obj_characters_center);
	obj.p1 = p1;
	obj.p2 = p2;
	show_debug_message("created center");
}