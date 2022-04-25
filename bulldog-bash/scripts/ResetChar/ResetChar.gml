// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ResetChar(player){
		player.myHealth = 100;
		player.phy_linear_velocity_x = 0;
		player.phy_linear_velocity_y = 0;
		player.phy_speed_x = 0;
		player.phy_speed_y = 0;
		player.phy_angular_velocity = 0;
		player.phy_position_x = player.startX;
		player.phy_position_y = player.startY;
		player.canMove=true;
		player.canAttack=true;
		player.frozen=false;
		show_debug_message("I died!");
}