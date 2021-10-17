//passes in p1, p2
//show_debug_message(argument0)

switch (argument0) {
	case CHAR_CHUN:
		//show_debug_message("CHAR CHUN");
		sp_idle = spr_chun_idle;
		sp_forward = spr_chun_walk_forward;
		sp_backward = spr_chun_walk_backward;
		sp_jump = spr_chun_jump; 
		sp_punch = spr_chun_punch;
		sp_jump_punch = spr_chun_jump_punch;
		//jump kick sprite is just a kick
		sp_kick = spr_chun_jump_kick;
		sp_knockback = spr_chun_knockback;
		sp_block = spr_chun_block
		sprite_index = sp_idle;
	break;
	
	case CHAR_SALOVEY:
		//show_debug_message("CHAR SALOVEY");
		sp_idle = spr_salovey_idle;
		sp_forward = spr_salovey_walk_forward;
		sp_backward = spr_salovey_walk_backward;
		//sp_jump = spr_salovey_jump; salovey's jump sprite doesn't exist yet
		sp_punch = spr_salovey_punch;
		//sp_jump_punch = spr_salovey_jump_punch; sprite doesn't exist yet
		//jump kick sprite is just a kick
		sp_kick = spr_salovey_kick;
		sp_knockback = spr_salovey_knockback;
		sp_block = spr_salovey_block
		sprite_index = sp_idle;
	break;
	
}
