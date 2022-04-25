if (!obj_controller.paused) {
	just_jumped = false;

	//char control
	CharacterControl();

	//animation control
	AnimationControl();
	
	//pull hurtbox
	with(hurtbox){
		x = other.x + xOffset;
		y = other.y + yOffset;
	}
	//pull hitbox (only with certain hitboxes)
	if (hitbox != noone){
		with(hitbox){
			x = other.x + xOffset;
			y = other.y + yOffset;
		}
	}
	// cursed hitbox maker function
	MakeAttack();

	//-----------------------------FOR DASHING--------------------------------//
	//This prevents multidash between dashes (stops checking during animation)
	if(floor(sprite_index) != sp_dash_forward and floor(sprite_index) != sp_dash_backward) { 
		CheckDashing();
	}
	//-----------------------------FOR DASHING--------------------------------//

	
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
}
