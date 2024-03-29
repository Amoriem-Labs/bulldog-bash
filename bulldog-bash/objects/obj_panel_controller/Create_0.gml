/// @description Insert description here
// You can write your code in this editor
p1_selector = instance_find(obj_char_selector, 0)
p2_selector = instance_find(obj_char_selector, 1)

p1_selector.static_sprite = spr_select_p1_static
p2_selector.static_sprite = spr_select_p2_static
p1_selector.flashing_sprite = spr_select_p1
p2_selector.flashing_sprite = spr_select_p2

p1_selector.sprite_index = spr_select_p1
p2_selector.sprite_index = spr_select_p2

p1_selector.left = ord("A")
p1_selector.right = ord("D")
p1_selector.confirm = ord("E")
p1_selector.back = ord("R")
p1_selector.portrait_index = 0


p2_selector.left = vk_left
p2_selector.right = vk_right
p2_selector.confirm = 190 //.
p2_selector.back = 188 //,
p2_selector.portrait_index = 1

portraits[0] = instance_find(obj_select_chun, 0)
portraits[1] = instance_find(obj_select_salovey, 0)

state = STATE_CHAR_SELECT
p1_selector.controller = self
p2_selector.controller = self

elapsed = 0
bgm = audio_play_sound(roma_4_charselect, 0, true);
show_debug_message("controller initialized")
