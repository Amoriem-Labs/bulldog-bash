/// @description Insert description here
// You can write your code in this editor
k_left = keyboard_check(vk_left);
k_right = keyboard_check(vk_right);
k_up = keyboard_check(vk_up);
k_down = keyboard_check(vk_down);

h_speed = 10;
v_speed = 10; 

h_move = k_right - k_left;
v_move = k_down - k_up;

view_xport[0] -= h_speed * h_move;
view_yport[0] -= v_speed * v_move;
