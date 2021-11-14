/// @description Health bar flash logic

if (activated = false and number_flashes > 1) {
	activated = true;
	number_flashes -= 1;
	alarm_set(0, HEALTH_FLASH_SPEED);
} else if (activated = true) {
	activated = false;
	alarm_set(0, HEALTH_FLASH_SPEED);
}