/// @description Insert description here
// You can write your code in this editor

if (p1_selector.char_selected and p2_selector.char_selected) {
	elapsed += delta_time
	if elapsed > 2 * 1000000 {
		global.p1_char = p1_selector.portrait_index 
		global.p2_char = p2_selector.portrait_index 
		room_goto(room_fight_splash)
	}
}
