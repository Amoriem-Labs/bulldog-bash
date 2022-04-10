// Start out hidden
visible = false;

// Which player opened the pause menu? Only they can interact with it
player = obj_controller.p1;

// Which frame to end on
target_image = 0;

// The current menu option
menu_option = 0;
// The maximum menu option (for detecting overflow) – min is 0
MAX_MENU_OPTION = 4