#region
right = (controller == CONT_P1) ? ord ("D") : vk_right;
left = (controller == CONT_P1) ? ord ("A") : vk_left;
#endregion

//char control
CharacterControl();

//animation control
AnimationControl();

//collision
CollisionAndMovements();