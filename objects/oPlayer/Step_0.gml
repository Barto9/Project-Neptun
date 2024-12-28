sprite_index = sPlayer_idle

//var bbox_side = bbox_left
//var look_direction

//key_left = keyboard_check(vk_left)
//key_right = keyboard_check(vk_right)

//h_speed = (-key_left + key_right) * player_speed
//v_speed = (v_speed+0.1) - (key_up*1)

//if h_speed > 0 {
//	bbox_side = bbox_right
//	look_direction = 1
//	sprite_index = sPlayer_walk
//	}else{ 
//	bbox_side = bbox_left
//	look_direction = -1
//	sprite_index = sPlayer_walk
//}
//if h_speed = 0 sprite_index = sPlayer_idle

//if tilemap_get_at_pixel(tilemap, bbox_side + h_speed, bbox_top) != 0 || tilemap_get_at_pixel(tilemap, bbox_side + h_speed, bbox_bottom) != 0
//{
//	if h_speed > 0
//		x = x - (x % 32) + 31 - (bbox_right - x)
//	else {
//		x = x- (x % 32) - (bbox_left-x)
//	}
//	h_speed = 0
//}
//x += h_speed

//if v_speed > 0 {
//	bbox_side = bbox_bottom
//}else{ 
//	bbox_side = bbox_top
//}
//if tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + v_speed) != 0 || tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + v_speed) != 0
//{
//	if v_speed > 0
//		y = y - (y % 32) + 31 - (bbox_bottom - y)
//	else {
//		y = y - (y % 32) - (bbox_top - y)
//	}
//	v_speed = 0
//}
//y += v_speed;

//image_xscale = look_direction

v_speed += 0.1
h_speed = 0

if keyboard_check(vk_left) {
	h_speed = -1*player_speed
	sprite_index = sPlayer_walk
	image_xscale = -1
}

if keyboard_check(vk_right) {
	h_speed = +1*player_speed
	sprite_index = sPlayer_walk
	image_xscale = 1
}

if place_meeting(x,y+1, tilemap[global.current_layer]) {
	v_speed = 0
	
	if keyboard_check(vk_up)
	{
		v_speed = -5
	}
} else {
	sprite_index = sPlayer_air
}

move_and_collide(h_speed, v_speed, all)
