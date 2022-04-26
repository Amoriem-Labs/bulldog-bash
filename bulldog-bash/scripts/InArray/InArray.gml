// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InArray(array, value){
	var _length = array_length_1d(array);
	for(var i = 0; i < _length; ++i){
		if(array[i] == value){
				return true;
		}
	}
	return false;
}
