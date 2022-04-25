// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EndGame(){
	p1.canMove = false
	p2.canMove = false
	p1.canAttack = false
	p2.canAttack = false
	
	game_ended = true
	
	
	//win_splash = layer_instance_get_instance(inst_win_splash)
	if winner == p2 {
		inst_win_splash.sprite_index = spr_p2_wins;
		voiceline = snd_p2_wins
	}
	else {
		voiceline = snd_p1_wins
	}
	inst_win_splash.visible = true;
	audio_play_sound(voiceline, 1, false);
	alarm_set(0, (audio_sound_length(voiceline) + 2.5)*room_speed);
}