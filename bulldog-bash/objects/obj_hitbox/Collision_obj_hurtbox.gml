/// @description Attack hit logic
// If not on ignoreList, hit and ignore
show_debug_message("bang");
if(!InArray(ignoreList, other.owner)){
	array_push(ignoreList, other.owner);
	show_debug_message("hit");
	with(other.owner){
		LoseHealth(damage);
	}
}
