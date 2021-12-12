// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckSchedule(){
	for (var i = 0; i < ds_list_size(schedule); i++) {
		var item = schedule[| i];
		if (item[1] <= current_time) {
			item[0]();
			ds_list_delete(schedule, i);
			i--;
		}
	}
}
