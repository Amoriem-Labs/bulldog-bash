// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackControl(){
	punch = (controller == CONT_P1) ? ord ("R") : ord ("M");
	//kick and special attack key presses don't work for salovey
	kick = (controller == CONT_P1) ? ord ("T") : ord ("<");
	spcl_atk = (controller == CONT_P1) ? ord ("Y") : ord (">");
	block = (controller == CONT_P1) ? ord ("C") : ord ("N");
}
