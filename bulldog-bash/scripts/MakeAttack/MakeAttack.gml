// Called on step for now, hopefully can make less frequent later
function MakeAttack(){
	//punch
	if(sprite_index == sp_punch and image_index == 2){
		hitbox = CreateHitbox(60 * image_xscale,50,80 * image_xscale,-120,4,PUNCH_DMG,45);
		//(x scale, y scale, x offset, y offset, time, damage, hitstun)
	}
	
	//kick
	if(sprite_index == sp_kick and image_index > .85 and image_index < .95){
		//frames are not integers here
		hitbox = CreateHitbox(80 * image_xscale,50,80 * image_xscale,-140,6,KICK_DMG,45);
		//(x scale, y scale, x offset, y offset, time, damage, hitstun)
	}
}