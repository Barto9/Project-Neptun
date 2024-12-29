if(global.color != 3)
{
	global.color += 1;
}

else if(global.color == 3)
{
	global.color = 0;	
}

switch (global.color)
{
	case 0:
		//white (default)
		image_blend = $FFFFFFFF & $ffffff;
		image_alpha = ($FFFFFFFF >> 24) / $ff;
		
	break;
	
	case 1:
		//red
		image_blend = $FF0000FF & $ffffff;
		image_alpha = ($FF0000FF >> 24) / $ff;
	break;
	
	case 2:
		//blu
		image_blend = $FFFF0000 & $ffffff;
		image_alpha = ($FFFF0000 >> 24) / $ff;
	break;
	
	case 3:
		//gre
		image_blend = $FF00FF00 & $ffffff;
		image_alpha = ($FF00FF00 >> 24) / $ff;
	break;
}