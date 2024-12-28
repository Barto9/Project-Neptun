global.current_layer ++
layer_set_visible("Effect_2",true)
alarm[0]=5

if(global.current_layer >2)
	global.current_layer = 0
	
switch (global.current_layer ) {
	case 0:
	{
		layer_set_visible("Red",true)
		layer_set_visible("Green",false)
		layer_set_visible("Blue",false)
		image_blend = c_red
		break
	}
	case 1:
	{
		layer_set_visible("Red",false)
		layer_set_visible("Green",true)
		layer_set_visible("Blue",false)
		image_blend = make_color_rgb(0,255,0)
		break
	}
	case 2:
	{
		layer_set_visible("Red",false)
		layer_set_visible("Green",false)
		layer_set_visible("Blue",true)
		image_blend = make_color_rgb(0,64,255)
		break
	}
		
}