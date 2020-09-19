/// @description Insert description here
// You can write your code in this editor
p1_damage = keyboard_check(ord("f"));
p2_damage = keyboard_check(ord("j"));

if (p1_damage && p1_hp > 0) {
	p1_hp -= 10;
};

if (p2_damage && p2_hp > 0) {
	p2_hp -= 10;
};