just_jumped = false;

//char control
CharacterControl();

//animation control
AnimationControl();

//-----------------------------FOR DASHING--------------------------------//
//This prevents multidash between dashes (stops checking during animation)
if(floor(sprite_index) != sp_dash_forward and floor(sprite_index) != sp_dash_backward) { 
	CheckDashing();
}
//-----------------------------FOR DASHING--------------------------------//

//show_debug_message(string(x) + " " + string(y));
	
if (abs(phy_rotation) > 3) {
	if (phy_rotation > 0) {
		phy_rotation -= 0.0002*delta_time;
	}
	else {
		phy_rotation += 0.0002*delta_time;
	}
}

phy_angular_velocity = 0;

grounded = false;