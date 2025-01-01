window_set_size(1080,720)

key_left = 0
key_right = 0
key_up = 0

h_speed = 0
v_speed = 0

player_speed = 5

global.current_layer = 0
image_blend = c_red

tilemap  = [ layer_tilemap_get_id("Red_collisions"), layer_tilemap_get_id("Green_collisions"), layer_tilemap_get_id("Blue_collisions")]