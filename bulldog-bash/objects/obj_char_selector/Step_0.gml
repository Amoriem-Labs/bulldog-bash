/// @description Insert description here
// You can write your code in this editor
if controller.state == STATE_CHAR_SELECT {
	if !char_selected and kcp(right) {
		portrait_index = (portrait_index + 1) % N_CHARACTERS
		x = controller.portraits[portrait_index].x
		audio_play_sound(select, 1, false);
	}
	if !char_selected and kcp(left) {
		portrait_index -= 1
		if portrait_index < 0 {
			portrait_index = N_CHARACTERS + portrait_index
		}
		x = controller.portraits[portrait_index].x
		audio_play_sound(select, 1, false);

	}
	
	if char_selected and kcp(back) {
		audio_stop_sound(sfx);
		audio_play_sound(select_back, 1, false);
		alarm[0] = -1;
		ready = false;
		char_selected = false;
		sprite_index = flashing_sprite;
	}
	
	if kcp(confirm) {
		char_selected = true
		sprite_index = static_sprite
		switch portrait_index {
			case CHAR_CHUN:
				quote = demonstration
				break;
			case CHAR_SALOVEY:
				quote = whatareyoufor
				break;
		}
		len = audio_sound_length(quote);
		sfx = audio_play_sound(quote, 2, false);
		alarm_set(0, len*room_speed)
	}
}

