// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FreezeFrame(){
	if (round(image_index) >= image_number - 5) {
		image_index = image_number - 5;
	}
}