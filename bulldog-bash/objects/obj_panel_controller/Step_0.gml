/// @description Insert description here
// You can write your code in this editor

if (p1_selector.char_selected and p2_selector.char_selected) {
	rm = room_map_old_campus
	//c = room_instance_add(rm, 0, 0, obj_controller)
	global.p1_char = p1_selector.portrait_index 
	global.p2_char = p2_selector.portrait_index 
	room_goto(room_map_old_campus)
}
