// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScheduleTask(task, delay){
	ds_list_add(global.schedule, [task, delay + current_time]);
}