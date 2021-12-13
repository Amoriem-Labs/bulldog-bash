/// @description Insert description here
// You can write your code in this editor

// Check to see if any scheduled tasks are up for execution
CheckSchedule();

// Check for keyboard input
KeyboardInput();


// V ------ FROM VIEWPORT MERGE ------ V
p1s = sign(p1.image_xscale); //for flipsides 
p2s = sign(p2.image_xscale);
if(p1s == 1) {
	newx = p1.x - CHAR_PADDING; //camera off set from center of char, 75 rn
} else {
	newx = p2.x - CHAR_PADDING;
}
newx_dist = -1 * p2s * p2.x - p1s * p1.x + 2*CHAR_PADDING;
newy_dist = 1204 / (room_width / newx_dist); //1204 is room height + slab
newy = 1204 - newy_dist - 0.085 * (room_width - newx_dist); //the third - expression makes slab zoom
if(newx_dist > fixed_dist) { //helps in arena locking
	oldy = newy;
}

py1loc = p1.y - p1.sprite_height + 50; 
py2loc = p2.y - p2.sprite_height + 50;
pyloc = min(py1loc, py2loc); //higher person gets the dib!

if(newx_dist > fixed_dist) {
	fixed_dist = STARTING_DISTANCE;
	if(pyloc > newy) {
		//cam.newy = newy;
		final_y = newy;
	} else {
		//cam.newy = pyloc;
		final_y = pyloc;
	}
	//cam.x_dist = newx_dist; 
	//cam.y_dist = newy_dist;
	final_x_dist = newx_dist;
	final_y_dist = newy_dist;
}
else {
	fixed_dist = cam.x_dist;
	if(pyloc > oldy) {
		//cam.newy = oldy;
		final_y = oldy;
	} else {
		//cam.newy = pyloc;
		final_y = pyloc;
	}
}

if(p1s == 1) { //positive	
	if(p1.x < cam.newx + CHAR_PADDING) { 	
		//cam.newx = newx;
		final_x = newx;
	}
	//else if (p2.x > cam.newx + cam.x_dist - 75) {
	else if (p2.x > cam.newx + final_x_dist - CHAR_PADDING) {
		//cam.newx = p2.x - cam.x_dist + 75; //more precise version of S_D because might not stop exactly at S_D
		final_x = p2.x - final_x_dist + CHAR_PADDING;
	}
} else { //flipped
	if(p2.x < cam.newx + CHAR_PADDING) { 	
		//cam.newx = newx;
		final_x = newx;
	}
	//else if (p1.x > cam.newx + cam.x_dist - 75) {
	else if (p1.x > cam.newx + final_x_dist - CHAR_PADDING) {
		//cam.newx = p1.x - cam.x_dist + 75;
		final_x = p1.x - final_x_dist + CHAR_PADDING;
	}
}



ds_queue_enqueue(x_q, final_x);
ds_queue_enqueue(y_q, final_y);
ds_queue_enqueue(x_dist_q, final_x_dist);
ds_queue_enqueue(y_dist_q, final_y_dist);

//show_debug_message(p1.phy_speed_x);
if(abs(p1.phy_speed_x) > WALK_SPD * 1.1 or abs(p2.phy_speed_x) > WALK_SPD * 1.1)  { //change 1.1 if cam is weird
	if(gap) {
		gap = false;
		for(i=0; i<10; i++) {
			ds_queue_dequeue(x_q);
			ds_queue_dequeue(y_q);
			ds_queue_dequeue(x_dist_q);
			ds_queue_dequeue(y_dist_q);
		}
	}
	cam.newx = final_x;
	cam.newy = final_y;
	cam.x_dist = final_x_dist;
	cam.y_dist = final_y_dist;
	
	ds_queue_dequeue(x_q);
	ds_queue_dequeue(y_q);
	ds_queue_dequeue(x_dist_q);
	ds_queue_dequeue(y_dist_q);
}
else {
	if(not gap) {
		gap = true;
		for(i=0; i<10; i++) {
			ds_queue_enqueue(x_q, final_x);
			ds_queue_enqueue(y_q, final_y);
			ds_queue_enqueue(x_dist_q, final_x_dist);
			ds_queue_enqueue(y_dist_q, final_y_dist);
		}
	}
	cam.newx = ds_queue_dequeue(x_q);
	cam.newy = ds_queue_dequeue(y_q);
	cam.x_dist = ds_queue_dequeue(x_dist_q);
	cam.y_dist = ds_queue_dequeue(y_dist_q);
}



//-----------------OLD JUMPBASE IDEA--------------------// this shit btw wasted 24 hrs of my time fuck this 
/*
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

//show_debug_message("Coord: " + string(newx) + " " + string(newx_dist) + " " + string(newy_dist) + " " + string(newy));
//Last resort: do two camera calculation system for in air and not in air

camy = camera_get_view_y(view_camera[0]);
pyloc = p1.y - p1.sprite_height + 50; 
if jump {
	B = (1204 - (p2.x - p1.x)/room_width * 1204) / pyloc;
	show_debug_message(B);
} //useless approach
} //useless approach
//show_debug_message(string(newx - cam.newx) + " " + string(newy - cam.newy));
//more solution for this on notes, test after math test. 
y_diff = jump_base_y - pyloc; //actually it makes more sense for jump_base_y to stay in place


//just make it so that x, xdist, and ydist scale accordingly
//y_diff = new_jump_y - pyloc;
//IT SHOULD BE WHEN CHAR PASSES OLD BASE, NOT CAM! BECAUSE CHANGING X CHANGES CAM AS WELL SO UNSTABLE

if(not(jump) and pyloc < camy and p1.phy_linear_velocity_y < 0) { //y_diff >= 0 and p1.phy_linear_velocity_y < 0) { //>=?
	//show_debug_message("info " + string(newy) + " " + string(jump_base_y) + " " + string(pyloc));
	jump_base_y = camera_get_view_y(view_camera[0]); //more than just a Y value on overall map
	//should scale off of current map pos? ex. same pt spot as viewport shrinks
	//jump_base_x = camera_get_view_x(view_camera[0]); //jump_base x and y records the point, top left corner
	//pt should get lower towards bottom right, for example
	jump = true;
	//falling = true; //the glitch happens due to math, not logic!
	show_debug_message("registered " + string(y_diff) + " " + string(pyloc) + " " + string(camy));
	//if linear y velocity is positive then it's falling (y-axis orientation diff)
}
else if (y_diff < 0) { //has to be going up
	y_diff = 0; //a little glitch happens at the end of air cycle CUZ SET TO 0 SUDDENLY
	//Suddenly newy - something => newy - 0
	//PROBLEM IDENTIFIED!! SETTING TO 0!!!
	//ACTUALLY THE PROBLEM ISSSSSSSSSSSSSSSSSSSSSSSSSS:
	//SPEED OF CAM MOVING DOWN FASTER THAN CHAR FALLING, SO NOT PARALLEL -> BUG
	//it happens from "registered" twice, again from landing crossing the same y axis
	 ////NOOOO NOT YOU PLS NOT THE = CAMY THAT KEPT RESEETING PLS
	 //basically the reason is hitting the same point twice, once ascending and once descending
	 //but why doesn't it happen when jumping in place?
	jump_base_y = camera_get_view_y(view_camera[0]);
	//jump_base_y = camy;
	jump = false;
}

shrink_ratio = (1204 - newy) / 1204;
show_debug_message(shrink_ratio);

//show_debug_message("..."); //within 1 cycle the glitch happened...
//x_ratio = (camera_get_view_x(view_camera[0]) - jump_base_x) / room_width; //how much x inc/dec in decimal, scale y off of it
//what if char jumps... cam x stays the same tho so not affected
//new_jump_y = jump_base_y * (1 + x_ratio);

//old base not good. Currently bugs when y and char changes together


if(newx_dist > STARTING_DISTANCE) {
	cam.newx = newx;
	//REAAAAAAAAAAAAAAAAAAAAAAAAAAAL PROBLEMMMMMMMMMMMMM:
	cam.newy = newy - y_diff;//right now it only works on single axis Y. If X changing causes Y to change, then cam won't follow 2x time
	cam.x_dist = newx_dist; 
	cam.y_dist = newy_dist; 
}
else {
	//cam.newy = newy - y_diff;
	cam.newy = jump_base_y - y_diff; //I'll have to modify the initial jump base based off of char's x position and ratio accordingly along the way
	//jump_base should lower accordingly when char moves from left to right after jump
}

//show_debug_message(string(jump_base_y) + " " + string(y_diff) + " " + string(jump) + " " + string(camy)); //so jumpbase was changed...
//show_debug_message(string(newy - y_diff) + " " + string(newy) + " " + string(jump_base_y) + " " + string(y_diff));
	
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
}	*/

////////////////////////////////////////NEW TESTING AREA BELOW/////////////////////////////
//try modify og value when jump
//ZOOMING OUT WHEN JUMP EFFECT: 
//ZOOM IS SO FREAKING HARD I GIVE UP.........
//I forgot about using character's y position.. my bad
/*

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

//camy = camera_get_view_y(view_camera[0]);
camy = cam.newy;
camx = cam.newx;
pyloc = p1.y - p1.sprite_height; //hmmm
y_diff = camy - pyloc;

if(y_diff >= 0 or camy <= jump_base) {
	if (not(jump)) {
		jump = true;
		jump_base = camera_get_view_y(view_camera[0]);
	}
	//need to remember the original value somehow because y_diff keeps updating as well
	
	//camy = camera_get_view_y(view_camera[0]);
	//camx = camera_get_view_x(view_camera[0]);
	camy = cam.newy;
	camx = cam.newx;
	pyloc = p1.y - p1.sprite_height; //hmmm
	y_diff = camy - pyloc;
	
	newy_jump = -1 * y_diff;
	y_dist_jump = y_diff;
	x_dist_jump = ((cam.y_dist + y_diff) / cam.y_dist - 1) * cam.x_dist;
	newx_jump = -1 * x_dist_jump / 2 - camx + cam.x_dist / 2; */
	/*newy_jump = camy - y_diff; //can simplify
	y_dist_jump = cam.y_dist + y_diff; //modifying current values 
	x_dist_jump = (y_dist_jump / cam.y_dist) * cam.x_dist;
	newx_jump = camx + cam.x_dist / 2 - x_dist_jump / 2;*/
	//testing above...
	/*cam.newx = newx_jump; 
	cam.newy = newy_jump;
	cam.x_dist = x_dist_jump;
	cam.y_dist = y_dist_jump;*/
	//show_debug_message("Jumping"); 
/*} else {
	jump = false;
	jump_base = -1;
	
	newy_jump = 0;
	y_dist_jump = 0;
	x_dist_jump = 0;
	newx_jump = 0;
	//show_debug_message("Nope");
}

if(newx_dist > STARTING_DISTANCE) {
	cam.newx = newx + newx_jump; 
	cam.newy = newy + newy_jump;
	cam.x_dist = newx_dist + x_dist_jump;
	cam.y_dist = newy_dist + y_dist_jump;
}
else {
	
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
	
	//cam.newx = cam.newx + newx_jump; 
	cam.newy = cam.newy + newy_jump;
	cam.x_dist = cam.x_dist + x_dist_jump;
	cam.y_dist = cam.y_dist + y_dist_jump;
}

show_debug_message(string(newx) + " " + string(newy) + " " + string(newx_dist) + " " + string(newy_dist));
show_debug_message(string(newx_jump) + " " + string(newy_jump) + " " + string(x_dist_jump) + " " + string(y_dist_jump));
*/


//camx = camera_get_view_width(view_camera[0]);
//camy = cam.newy;

/*newy_jump = camy - y_diff; //can simplify
y_dist_jump = cam.y_dist + y_diff; //modifying current values 
x_dist_jump = (y_dist_jump / cam.y_dist) * cam.x_dist;
newx_jump = camx + cam.x_dist / 2 - x_dist_jump / 2;*/

//show_debug_message(string(y_diff) + " " + string(camy) + " " + string(jump_base) + " " + string(jump));
//it locks in box phase because box values are fixed so so are jump value not adjusted but stayed multiplied!

//show_debug_message(string(cam.newx) + " " + string(cam.newy) + " " + string(cam.x_dist) + " " + string(cam.y_dist))
/*if(cam.newx == newx) {
	show_debug_message("Using set 1");
}
else if (cam.newx == newx_dist) {
	show_debug_message("Using set 2");
}*/

/*if(y_diff > 0) {
	show_message("I'm over");
}*?

//set up a fixed cam when enter certain proximity
//in fixed cam mode, x can move, but y, x distance, and y distance are fixed
//when someone touches the edge, edge travels with them
//fixed cam breaks when two people are too far apart

//when decreases y by y_diff, increase x_diff and decrease x by the same proportion
// If y_diff < 0...
//newy_jump = pyloc         - 75?
//x_dist_jump = ((1204 - pyloc) / 1204) * room_width
//newx_jump = cam.newx + cam.x_dist / 2 - x_dist_jump / 2     //watch out for the 75 150 etc val!
