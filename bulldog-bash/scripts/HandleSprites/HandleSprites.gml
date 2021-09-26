//passes in p1, p2
//show_debug_message(argument0)

switch (argument0) {
	case CHAR_CHUN:
		//show_debug_message("CHAR CHUN");
		sp_idle = spr_chun_idle;
		sp_forward = spr_chun_walk_forward;
		sp_backward = spr_chun_walk_backward;
		sprite_index = sp_idle;
	break;
	
	case CHAR_SALOVEY:
		//show_debug_message("CHAR SALOVEY");
		sp_idle = spr_salovey_idle;
		sp_forward = spr_salovey_walk_forward;
		sp_backward = spr_salovey_walk_backward;
		sprite_index = sp_idle;
	break;
	
}
