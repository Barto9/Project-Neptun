y_speed += 0.1
x_speed = 0


if keyboard_check(ord("A"))
{
	x_speed = -2
	sprite_index = Sprt_Player_walking_left;
}

if keyboard_check(ord("D"))
{
	x_speed = 2
	sprite_index = Sprt_Player_walking_right
}

if keyboard_check(vk_nokey)
{
	sprite_index = Sprt_Player
}


if place_meeting(x, y+1, Floor)
{
	y_speed = 0
	if keyboard_check(ord("W"))
	{
		y_speed = -3
	}
}

move_and_collide(x_speed, y_speed, Floor)

