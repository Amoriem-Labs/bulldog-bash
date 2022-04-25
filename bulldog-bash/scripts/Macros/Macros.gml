#region //Characters
#macro CHAR_CHUN 0
#macro CHAR_SALOVEY 1
#macro N_CHARACTERS 2
#endregion

#region //Game Variables
#macro GRAVITY_FORCE 0.5
#macro WALK_SPD 4.1 //was 3
#macro SPRINT_SPD 8
#macro JUMP_FORCE -38
#macro FLY_SPEED -6.1
#macro DASH_TIMEPAUSE 10 //# fps allowed between dashing pause
#macro SHADOW_TIMER 10
#macro FALL_COEF 1
#macro N_JUMPS 2
#macro HEALTH_FLASH_SPEED 3
#macro HEALTH_NUM_FLASHES 0
#macro HEALTH_LOSS_STICK_TIME 30
#macro STARTING_DISTANCE 1000 //was 850
#macro CHAR_PADDING 125 //was 75 //can tune padding for wall dist from char :)
#macro room_total_height 1204

#endregion

#region //Controllers
#macro CONT_P1 0
#macro CONT_P2 1
#macro CONT_COM 2
#endregion

#region //States
#macro STATE_FREE 0
#macro STATE_PUNCH 1
#macro STATE_KICK 2
#macro STATE_BLOCK 3
#macro STATE_FDASH 4
#macro STATE_BDASH 5
#macro STATE_FLY 6
#endregion

#region //Attack Damage
#macro PUNCH_DMG 1
#macro PUNCH_RADIUS 50
#macro KICK_DMG 10
#macro KICK_RADIUS 65
#macro SPCL_ATK_DMG 20
#macro SPCL_RADIUS 1000
#macro GLOBAL_ATTACK_COOLDOWN 300
#macro GLOBAL_MOVE_COOLDOWN 170
#endregion

#region //Jetpack constants
#macro MAX_FUEL 100
#macro FUEL_DRAIN 1
#macro FUEL_REGEN 10
#endregion
#region //char select
#macro STATE_CHAR_SELECT 0
#macro STATE_STAGE_SELECT 1
#macro STATE_DONE_SELECT 2
#endregion
