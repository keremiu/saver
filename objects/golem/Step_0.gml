/// @description Insert description here
// You can write your code in this editor


if(x >= temp + 100 or x <= temp - 100) {
	sprite_index = golem_move;
	 image_xscale = -image_xscale;	
	dir = -dir;
	if(temp<x)
	image_xscale=-1;
	if(temp>x)
	image_xscale=1;
}


moveX = dir * movespeed;
x += moveX;

	if(place_meeting(x, y + moveY, o_ground))
{
	while(!place_meeting(x, y+sign(moveY), o_ground))
	{
		y = y + sign(moveY);
	}	
	moveY = 0;
}
y+=moveY;

 if(hp <= 0) 
 {
	 instance_destroy(golem);
	 defated = true;
 }