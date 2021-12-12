// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoseHealth(amt, player) {
	if (player = 1)
	{
		activated = true;
		number_flashes = HEALTH_NUM_FLASHES;
		alarm_set(0, HEALTH_FLASH_SPEED);
		global.left_player_health -= amt;
		health_lost += amt;
		alarm_set(1, HEALTH_LOSS_STICK_TIME);
	}
	else if (player = 2)
	{
		activated = true;
		number_flashes = HEALTH_NUM_FLASHES;
		alarm_set(0, HEALTH_FLASH_SPEED);
		global.right_player_health -= amt;
		health_lost += amt;
		alarm_set(1, HEALTH_LOSS_STICK_TIME);
	}
}