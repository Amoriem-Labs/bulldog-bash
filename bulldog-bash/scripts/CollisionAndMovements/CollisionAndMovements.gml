// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CollisionAndMovements(){
	vspd += grv;
	
	// vertical collision
	landed = place_meeting(x, y+vspd, obj_floor);
	if landed {
		while !place_meeting(x, y+sign(vspd), obj_floor) {
			y += sign(vspd);
		}
		vspd = 0;
	}
	
	x += hspd
	y += vspd
}
