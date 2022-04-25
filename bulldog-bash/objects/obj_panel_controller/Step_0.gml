/// @description Insert description here
// You can write your code in this editor

if (p1_selector.ready and p2_selector.ready) {
	global.p1_char = p1_selector.portrait_index 
	global.p2_char = p2_selector.portrait_index
	audio_stop_sound(bgm);
	room_goto(room_fight_splash)
}
