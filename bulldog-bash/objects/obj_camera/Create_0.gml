camera = camera_create();
var viewmat = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var projmat = matrix_build_projection_ortho(640,480,1,10000);
camera_set_view_mat(camera,viewmat);
camera_set_proj_mat(camera,projmat);
view_camera[0] = camera;
camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0])/2), y - (camera_get_view_height(view_camera[0]/2)));
