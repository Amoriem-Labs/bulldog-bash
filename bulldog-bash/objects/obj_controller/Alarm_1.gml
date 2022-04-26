/// @description restart bgm
// You can write your code in this editor

bgm_choice = bgm_choices[irandom(array_length(bgm_choices) - 1)]

alarm_set(1, audio_sound_length(bgm_choice)*room_speed);

bgm = audio_play_sound(bgm_choice, 0, true);

