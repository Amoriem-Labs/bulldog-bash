/// @description Insert description here
// You can write your code in this editor

p1s = sign(p1.image_xscale); //for flipsides 
p2s = sign(p2.image_xscale);
if(p1s == 1) {
	newx = p1.x - 75; //camera off set from center of char, 75 rn
} else {
	newx = p2.x - 75;
}
newx_dist = -1 * p2s * p2.x - p1s * p1.x + 150;
newy_dist = 1204 / (room_width / newx_dist); //1204 is room height + slab
newy = 1204 - newy_dist - 0.085 * (room_width - newx_dist); //the third - expression makes slab zoom

if(newx_dist > STARTING_DISTANCE) {
	cam.newx = newx; //I SEE WHY FUCK THISASDFASDF
	cam.newy = newy;
	cam.x_dist = newx_dist;
	cam.y_dist = newy_dist;
}
if(p1s == 1) { //positive	
	if(p1.x < cam.newx + 75) { 	
		cam.newx = newx;
	}
	else if (p2.x > cam.newx + cam.x_dist - 75) {
		cam.newx = p2.x - cam.x_dist + 75; //more precise version of S_D because might not stop exactly at S_D
	}
} else { //flipped
	if(p2.x < cam.newx + 75) { 	
		cam.newx = newx;
	}
	else if (p1.x > cam.newx + cam.x_dist - 75) {
		cam.newx = p1.x - cam.x_dist + 75;
	}
}	

	

//show_debug_message(string(p2.x - STARTING_DISTANCE + 75) + " " + string(cam.newx));

//set up a fixed cam when enter certain proximity
//in fixed cam mode, x can move, but y, x distance, and y distance are fixed
//when someone touches the edge, edge travels with them
//fixed cam breaks when two people are too far apart