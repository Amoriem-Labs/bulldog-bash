switch (argument0) {
	case CHAR_CHUN:
		sp_idle = spr_chun_idle;
		sp_forward = spr_chun_walk_forward;
		sp_backward = spr_chun_walk_backward;
		sp_jump = spr_chun_jump; 
		sp_punch = spr_chun_punch;
		sp_jump_punch = spr_chun_jump_punch;
		sp_kick = spr_chun_kick;
		sp_knockback = spr_chun_knockback;
		sp_block = spr_chun_block;
		sp_jump = spr_chun_jump;
		sp_dash_forward = spr_chun_dash_forward; 
		sp_dash_backward = spr_chun_dash_backward;
		sp_special = spr_chun_special;
		sp_jetpack_air = spr_chun_jetpack_air;
		sp_jetpack_launch = spr_chun_jetpack_launch;
		sprite_index = sp_idle;
	break;
	
	case CHAR_SALOVEY:
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
		sp_jump = spr_salovey_idle; //to change when jump anim available
		sp_dash_forward = spr_salovey_dash_forward;
		sp_dash_backward = spr_salovey_dash_backward;
		sp_special = spr_salovey_special;
		sp_jetpack_air = spr_salovey_jetpack_air;
		sp_jetpack_launch = spr_salovey_jetpack_launch;
		sprite_index = sp_idle;
	break;
	
}
