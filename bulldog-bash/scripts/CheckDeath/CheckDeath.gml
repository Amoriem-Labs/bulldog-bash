// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckDeath(){
	if (myHealth <= 0) {
		myHealth = 100;
		phy_linear_velocity_x = 0;
		phy_linear_velocity_y = 0;
		phy_speed_x = 0;
		phy_speed_y = 0;
		phy_angular_velocity = 0;
		phy_position_x = startX;
		phy_position_y = startY;
		show_debug_message("I died!");
		return 1;
	} else {
		return 0;
	}
}