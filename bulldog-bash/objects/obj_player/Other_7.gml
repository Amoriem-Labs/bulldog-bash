/// @description Insert description here
// You can write your code in this editor
//show_debug_message(state != STATE_FREE || (fdash != true || bdash != true));

if (state != STATE_FREE) {
	if(stunned == 0){
		state = STATE_FREE;
	}
}
