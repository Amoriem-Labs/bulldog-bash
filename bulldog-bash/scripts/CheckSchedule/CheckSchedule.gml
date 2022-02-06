// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckSchedule(){
	for (var i = 0; i < ds_list_size(global.schedule); i++) {
		var item = global.schedule[| i];
		if (item[1] <= current_time) {
			item[0]();
			ds_list_delete(global.schedule, i);
			i--;
		}
	}
}
