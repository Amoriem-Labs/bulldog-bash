// Called on step for now, hopefully can make less frequent later
function MakeAttack(){
	//punch
	if(sprite_index == sp_punch and image_index == 2){
		hitbox = CreateHitbox(60 * image_xscale,50,80 * image_xscale,-120,4,PUNCH_DMG,PUNCH_STUN, self);
		//(x scale, y scale, x offset, y offset, time, damage, hitstun)
	}
	
	//kick
	if(sprite_index == sp_kick and image_index > .85 and image_index < .95){
		//frames are not integers here
		hitbox = CreateHitbox(80 * image_xscale,50,80 * image_xscale,-140,5,KICK_DMG,KICK_STUN, self);
		//(x scale, y scale, x offset, y offset, time, damage, hitstun)
	}
	//specials
	//these are decided by specific sprite so as to differentiate b/t chun and salovey
	//chun's makes its own hitbox
	if(sprite_index == sp_special){
		show_debug_message(sprite_index);
		show_debug_message(image_index);
	}
	if(sprite_index == spr_chun_special and image_index == 2.10){
		with (instance_create_layer(x, y - 150, "Instances", obj_chun_projectile)) {
			var flavor = choose(1, 2, 3);
			switch (flavor) {
				case 1:
					audio_play_sound(nopeace, 1, false);
					sprite_index = spr_chunproj_nopeace;
					length = 405;
					break;
				case 2:
					audio_play_sound(overcome, 1, false);
					sprite_index = spr_chunproj_overcome;
					length = 457;
					break;
				case 3:
					audio_play_sound(renouncegod, 1, false);
					sprite_index = spr_chunproj_renouncegod;
					length = 264;
				break;
			}
			dir = (other.opponent.x > x) ? 1 : -1;
			origin = other;
			// -1 in the CreateHitbox args means no time limit (hitbox destructs with projectile)
			hitbox = CreateHitbox(length * image_xscale,44,length / -2 * image_xscale,-22,-1,SPCL_CHUN_DMG,SPCL_CHUN_STUN, other.id);
		}
	}
	if(sprite_index == spr_salovey_special and image_index == 4.55){
		hitbox = CreateHitbox(70 * image_xscale,60,80 * image_xscale,-180,6,SPCL_SALOVEY_DMG,SPCL_SALOVEY_STUN, self);
	}
}