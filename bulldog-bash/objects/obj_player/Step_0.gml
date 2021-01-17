// @description Character controls


#region // keys
right = (controller == CONT_P1) ? ord("D") : ord("L");
left = (controller == CONT_P1) ? ord("A") : ord("J");
up = (controller == CONT_P1) ? ord("W") : ord("I");
down = (controller == CONT_P1) ? ord("S") : ord("K");
p1 = (controller == CONT_P1) ? ord("C") : ord("M"); 
k1 = (controller == CONT_P1) ? ord("V") : ord("N");
#endregion

// character control
CharControl()

// animation control
AnimationControl()

// Collision
CollisionAndMovements()

