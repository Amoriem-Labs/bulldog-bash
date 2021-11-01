switch (argument0) {
	case CHAR_CHUN:
		sp_idle = spr_chun_idle;
		sp_forward = spr_chun_walk_forward;
		sp_backward = spr_chun_walk_backward;
		sp_jump = spr_chun_jump;
		sp_dash_forward = spr_chun_dash_forward; 
		sp_dash_backward = spr_chun_dash_backward;
		sprite_index = sp_idle;
	break;
	
	case CHAR_SALOVEY:
		sp_idle = spr_salovey_idle;
		sp_forward = spr_salovey_walk_forward;
		sp_backward = spr_salovey_walk_backward;
		sp_jump = spr_salovey_idle; //to change when jump anim available
		sp_dash_forward = spr_salovey_dash_forward;
		sp_dash_backward = spr_salovey_dash_backward;
		sprite_index = sp_idle;
	break;
	
}
