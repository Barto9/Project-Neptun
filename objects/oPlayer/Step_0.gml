y_speed += 0.1
x_speed = 0

sprite_index = sPlayer_idle

if keyboard_check(vk_left)
{
	x_speed = -1*speed_factor
	sprite_index = sPlayer_walk
	image_xscale = -1
}

if keyboard_check(vk_right)
{
	x_speed = +1*speed_factor
	sprite_index = sPlayer_walk
	image_xscale = 1
}

if place_meeting(x,y+1, oBlock_corner) || place_meeting(x,y+1,oBlock_edge) || place_meeting(x,y+1,oBlock_end) || place_meeting(x,y+1,oBlock_mid) || place_meeting(x,y+1,oBlock_full)
{
	y_speed = 0
	
	if keyboard_check(vk_up)
	{
		y_speed = -2
	}
}
else
{
	sprite_index = sPlayer_air
}


move_and_collide(x_speed,y_speed,oBlock_edge)
move_and_collide(x_speed,y_speed,oBlock_corner)
move_and_collide(x_speed,y_speed,oBlock_end)
move_and_collide(x_speed,y_speed,oBlock_mid)
move_and_collide(x_speed,y_speed,oBlock_full)