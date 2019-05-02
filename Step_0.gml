/// @description Insert description here
// author: tekdogan

// direction configurations for making the
// monster's way directly to adam
horizontal_direction = sign(x - adam.x)
vertical_direction = sign(y - adam.y)

// setting speed configurations due to
// direction calculations above
horizontal_speed = horizontal_direction * walkingSpeed;
vertical_speed = vertical_direction * walkingSpeed;

// check if there is a collision
if( place_free(x-5, y) )
{
	// if not, keep going
	x -= horizontal_speed;
	// and set animation speed
	image_speed = walkingSpeed;
}
else
{
	// otherwise, step back
	x += horizontal_speed*2;
	// if too near to adam, damage him
	if(place_meeting(x-5, y, adam))
		adam.HP -= 1;
}


// same applies for vertical direction
if( place_free(x, y-5) )
{
	y -= vertical_speed;
	image_speed = walkingSpeed;
}
else
{
	y += vertical_speed*2;
	
	if(place_meeting(y-5, y, adam))
		adam.HP -= 1;
}