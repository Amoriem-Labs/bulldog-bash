/// @description Insert description here
// You can write your code in this editor

if (visible) {
	if (kcp(player.up)) {
		change_menu_option(menu_option, menu_option - 1);		if (menu_option < 0) menu_option = MAX_MENU_OPTION;
	}
	if (kcp(player.down)) {
		change_menu_option(menu_option, menu_option + 1);
	}
}

function change_menu_option(old_index, new_index) {
	// Loop the menu
	if (new_index < 0) new_index = MAX_MENU_OPTION;
	if (new_index > MAX_MENU_OPTION) new_index = 0;

	menu_option = new_index;
	if (abs(new_index - old_index) == 1) {
		if (new_index > old_index) {
			image_speed = 1;
			target_image = image_number - 1;
			image_index = 0
		} else {
			image_speed = -1;
			target_image = 0;
			image_index = image_number - 1;
		}
		switch (min(new_index, old_index)) {
			case 0:
				sprite_index = sp_pm_0_1;
			break;
			case 1:
				sprite_index = sp_pm_1_2;
			break;
			case 2:
				sprite_index = sp_pm_2_3;
			break;
			case 3:
				sprite_index = sp_pm_3_4;
			break;
		}
	} else {
		if (menu_option == 0) {
			sprite_index = sp_pm_0_1;
			image_index = 0;
			image_speed = 0;
		} else if (menu_option == MAX_MENU_OPTION) {
			sprite_index = sp_pm_3_4;
			image_index = image_number - 1;
			image_speed = 0;
		}
	}
}

open = function (opening_player) {
	visible = true;
	player = opening_player;
}
close = function () {
	visible = false;
}