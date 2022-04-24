/// @description Insert description here
// You can write your code in this editor
if controller.state == STATE_CHAR_SELECT {
	if !char_selected and kcp(right) {
		portrait_index = (portrait_index + 1) % N_CHARACTERS
		x = controller.portraits[portrait_index].x
	}
	if !char_selected and kcp(left) {
		portrait_index -= 1
		if portrait_index < 0 {
			portrait_index = N_CHARACTERS + portrait_index
		}
		x = controller.portraits[portrait_index].x
	}
	if kcp(confirm) {
		char_selected = true
		sprite_index = static_sprite
	}
}

