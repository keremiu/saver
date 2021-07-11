/// @description Insert description here
// You can write your code in this editor
 var right = keyboard_check(vk_right) or keyboard_check(ord("D"));
  var left = keyboard_check(vk_left) or keyboard_check(ord("A"));
  var jump = keyboard_check(vk_up) or keyboard_check(ord("W"));
 var  bend = keyboard_check(vk_down) or keyboard_check(ord("S"));
var lmb = mouse_check_button(mb_left);
var inputX = right-left;

moveX = inputX*movespeed;
moveY = moveY + grv;

temp = image_speed;

if(bend)
{
	sprite_index =bend1;
	if (image_speed > 0)
    {
    if (image_index >= image_number - 1) 
	image_speed=0;
    }
	
}
else
	image_speed=1;
if(right)
{
	sprite_index = move;
     image_xscale = 1;	
}
if(left)
{
	sprite_index = move;
     image_xscale = -1;		
}
if(left && jump)
{
	sprite_index = jump1;
	 if (image_index >= image_number - 1) 
	image_speed=0;
}
if(right && jump)
{
	sprite_index = jump1;
	 if (image_index >= image_number - 1) 
	image_speed=0;
}

if(!left and !right and !jump and !bend ) 
{
	sprite_index = state;
}


if (place_meeting(x, y+1, o_ground)) && (jump) 
{
	
	sprite_index = jump1;
    image_xscale = 1;	
	moveY = -5;
	 if (image_index >= image_number - 1) 
	image_speed=0;
}
if (place_meeting(x, y+1, o_box)) && (jump) 
{
	
	sprite_index = jump1;
    image_xscale = 1;	
	moveY = -5;
	 if (image_index >= image_number - 1) 
	image_speed=0;
}

if(place_meeting(x, y + moveY, o_ground))
{
	while(!place_meeting(x, y+sign(moveY), o_ground))
	{
		y = y + sign(moveY);
	}	
	moveY = 0;
}
if(place_meeting(x, y + moveY,  o_box))
{
	while(!place_meeting(x, y+sign(moveY),  o_box))
	{
		y = y + sign(moveY);
	}	
	moveY = 0;
}
if(place_meeting(x+moveX, y ,  o_box))
{
	while(!place_meeting(x+sign(moveX),y,  o_box))
	{
		x += sign(moveX);
	}	
	moveX=0;
}

if(lmb) 
{
	if(sprite_index != attack)
	{
		sprite_index = attack;
		ds_list_clear(hitByAttack);
	}
	mask_index = attack_hitbox;
}

var hitByAttackNow = ds_list_create();
var hits = instance_place_list(x, y, golem, hitByAttackNow, false);

if(hits > 0)
{
	
	for(var i = 0; i < hits; i++)
	{
		var hitID = hitByAttackNow[| i];
		
		if(ds_list_find_index(hitByAttack, hitID) == -1)
		{
			ds_list_add(hitByAttack, hitID);
			
			with(hitID)
			{
				golem.hp -= 2;
			}
		}
	}
}
x+=moveX;
y+=moveY;

