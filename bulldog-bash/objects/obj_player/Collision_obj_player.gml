/// @description Collisions between players
// Note that this checks for collisions between any part of player's collision masks
// Projectiles should be their own objects which we can detect collisions with
// For melee attacks, we should check for collisions with only attacking parts of opponent

if (canAttack) {
	HandleAttackCollisions();
}