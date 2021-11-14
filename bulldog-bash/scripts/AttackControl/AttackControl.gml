// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackControl(){
	punch = (controller == CONT_P1) ? ord ("R") : ord ("N");
	//special attack and block are on invalid keys for Salovey, maybe fix in the future
	kick = (controller == CONT_P1) ? ord ("T") : ord ("M");
	spcl_atk = (controller == CONT_P1) ? ord ("Y") : ord (">");
	block = (controller == CONT_P1) ? ord ("C") : ord ("<");
}
