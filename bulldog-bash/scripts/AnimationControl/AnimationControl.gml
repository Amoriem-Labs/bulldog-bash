anim_started = false;

function AnimationControl(){
	switch (state) {
		case STATE_FREE:
			// check for attacking anims. Need to change to allow animations to follow through state changes
			if kcp(punch) {
				state = STATE_PUNCH;
			}
			else if kcp(kick) {
				state = STATE_KICK;
			}
			else if kcp(block)
			{
				state = STATE_BLOCK
			}
			// check for movement anims
			else if phy_speed_y > 0 {
				sprite_index = sp_jump;
			}
			else if(fdash == true) {
				setSprite(sp_dash_forward, sp_dash_backward);
			}
			else if(bdash == true) {
				setSprite(sp_dash_backward, sp_dash_forward); //don't have to distinguish by char cuz Kevin's god code
			}	
			//else if phy_speed_y > 0 //to test for case if character is falling, need to change animation to fall animation
				//sprite_index = sp_jump;
			else if phy_speed_x == 0
			{
				sprite_index = sp_idle;
			}
			else
			{
				sprite_index = (sign (phy_speed_x) == sign (image_xscale)) ? sp_forward:sp_backward;
			}
			break;
			
		case STATE_PUNCH:
			sprite_index = sp_punch;
			fdash = false;
			bdash = false;
			break;
			
		case STATE_KICK:
			sprite_index = sp_kick;
			fdash = false;
			bdash = false;
			break;
			
		case STATE_BLOCK:
			sprite_index = sp_block;
			fdash = false; 
			bdash = false;
			break;
	}
}

//-----------------------------FOR DASHING--------------------------------//
function CheckDashing() {
	//show_debug_message(string(FdashingPrep) + " " + string(BdashingPrep) + " " + string(dashingTick));
	if(floor(sprite_index) == sp_idle 
		and dashingTick == DASH_TIMEPAUSE and FdashingPrep == false and BdashingPrep == false) { 
		//basically if first right/left tap has not been tapped, then don't do anything
		//this if fails when movement pressed, because no more idle!
		dashReset();
	}
	else if (FdashingPrep == true) { //in rightward dashing count!
		if(kcp(right)) { //dash pressed again during right count
			fdash = true;
			image_index = 0;
			if(fdash == false) { //set dash to false at the end of animation
				dashReset(); 
			}
		}
		else if(kcp(up) or kcp(left) or kcp(down) or kcp(punch) or kcp(kick) or kcp(block)) { //other keys other than same direction pressed so cancel and reset
			dashReset();
		}
			
		DashTimer(); //-1 every time to count
	}
	else if (BdashingPrep == true) { //in leftward dashing count!
		if(kcp(left)) { //dash pressed again during left count
			bdash = true;
			image_index = 0;
			if(bdash == false) { //set dash to false at the end of animation
				dashReset();
			}
		}
		else if(kcp(up) or kcp(right) or kcp(down) or kcp(punch) or kcp(kick) or kcp(block)) { //other keys other than same direction pressed so cancel and reset
			dashReset();
		}
			
		DashTimer(); //-1 every time to count
	}
	else if(kcp(right)) { //starts prep rightward
		FdashingPrep = true; 
		BdashingPrep = false;
		dashingTick = DASH_TIMEPAUSE; //resets time
	}
	else if(kcp(left)) { //starts prep leftward
		FdashingPrep = false; 
		BdashingPrep = true;
		dashingTick = DASH_TIMEPAUSE; //resets time
	}
}

//private helper function for CheckDashing
function DashTimer() {
	dashingTick -= 1;

	if(dashingTick <= 0){ //didn't press dash again so it will hit 0, exit dash
		 dashReset(); //resets it
	}
}

//private helper function for CheckDashing
function dashReset() {
	FdashingPrep = false;
	BdashingPrep = false;
	dashingTick = DASH_TIMEPAUSE;
}

//private helper function for CheckDashing
function setSprite(sp1, sp2) {
	if(image_xscale > 0) {
		sprite_index = sp1;  
	}
	else {
		sprite_index = sp2;
	}
}
//-----------------------------FOR DASHING--------------------------------//
	
