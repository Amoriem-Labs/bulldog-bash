// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CollisionAndMovements(){
	vspd += grv;
	
	// horizontal collision
	/*
	if place_meeting(x+hspd, y, obj_player) {
		while !place_meeting(x+sign(hspd), y, obj_player) {
			x += sign(hspd);
		}
		hspd = 0;
	}
	*/
	
	// vertical collision
	if place_meeting(x, y+vspd, obj_floor) {
		while !place_meeting(x, y+sign(vspd), obj_floor) {
			y += sign(vspd);
		}
		vspd = 0;
	}
	
	x += hspd
	y += vspd
}
