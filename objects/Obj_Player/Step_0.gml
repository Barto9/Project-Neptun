y_speed += 0.1

if(!is_grounded)
{
	sprite_index = Sprt_Player	
}
if (x_speed > 0)
{
	x_speed -= 0.15
}
else if(x_speed < 0)
{
	x_speed += 0.15
}

if keyboard_check(ord("A"))
{
	x_speed = -3
	if(is_grounded)
	{
	sprite_index = Sprt_Player_walking_left
	}
}

if keyboard_check(ord("D"))
{
	x_speed = 3
	if (is_grounded)
	{
	sprite_index = Sprt_Player_walking_right
	}
}

if keyboard_check(vk_nokey)
{
	sprite_index = Sprt_Player
}


if place_meeting(x, y+1, Floor)
{
	is_grounded = true
	y_speed = 0
	if keyboard_check(ord("W"))
	{
		y_speed = -4
	}
}
else
{
	is_grounded = false	
}

move_and_collide(x_speed, y_speed, Floor)

