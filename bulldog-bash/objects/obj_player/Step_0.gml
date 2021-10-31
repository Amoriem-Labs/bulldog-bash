//char control
CharacterControl();

//attacks
AttackControl();

//animation control
AnimationControl();

//collision. Should this still be here??
// CollisionAndMovements();

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