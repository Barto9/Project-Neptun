if(global.color == 0)
{
	global.color = 1;

	image_blend = $FF0000FF & $ffffff;
	image_alpha = ($FF0000FF >> 24) / $ff;
}

else if(global.color == 1)
{
	global.color = 0;

	image_blend = $FFFFFFFF & $ffffff;
	image_alpha = ($FFFFFFFF >> 24) / $ff;
}