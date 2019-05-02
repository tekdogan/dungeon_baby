/// @description Insert description here
// author: tekdoganxd


//if( HP <= 0)
//	  instance_destroy(adam, true);




// if 'up' or 'w' keys are pressed, check if there is
// a collision, then walk upward and animate object
if( keyboard_check(vk_up) || keyboard_check(ord("W") ) )
{
	// check for the collision
	if( place_free(x, y-walkingSpeed	) )
		// change the vertical speed
		y-= walkingSpeed;
	// animate the object
	image_speed = walkingSpeed / 4;
	// use appropriate sprite for walking
	sprite_index = adam_walking;
}

// same changes applies for other directions

if( keyboard_check(vk_down) || keyboard_check(ord("S") ) )
{
	if( place_free(x, y+walkingSpeed) )
		y+= walkingSpeed;
	image_speed = walkingSpeed / 4;
	sprite_index = adam_walking;
}

if( keyboard_check(vk_left) || keyboard_check(ord("A") ) )
{
	if( place_free(x-walkingSpeed, y) )
		x-= walkingSpeed;
	image_speed = walkingSpeed / 4;
	sprite_index = adam_walking;
}

if( keyboard_check(vk_right) || keyboard_check(ord("D") ) )
{
	if( place_free(x+walkingSpeed, y) )
		x+= walkingSpeed;
	image_speed = walkingSpeed / 4;
	sprite_index = adam_walking;
}

// if no key is pressed, then stop the
// animation and set speed to zero
if( keyboard_check(vk_nokey) )
{
	// change animation speed
	image_speed = 0;
	
	// set the idle sprite due to position
	switch(position)
	{
		case 0:
			sprite_index = adam_idle;
			break;
		
		case 1:
			sprite_index = adamHammer_idle;
			break;
	}
}

// if hammer is picked up and space key is pressed
// then attack the nearby enemies
if( keyboard_check(vk_space) && (position == 1) )
{
	// hitting animation
	sprite_index = adamHammer_hit;
	
	// if confronting the green monster
	// then destroy it after smash
	if( place_meeting(x, y-2, green_monster) )
	{
		instance_destroy(green_monster, true);
	}
	
	// if confronting trump instead
	// then destroy him
	if( place_meeting(x, y-2, trump) )
	{
		instance_destroy(trump, true);
	}
}

// pick up the hammer
if( keyboard_check(ord("1")) )
{
	position = 1;
}

// remain unarmed
if( keyboard_check(ord("0")) )
{
	position = 0;
}



if( place_meeting(x, y, hidden_obj) )
{
	hidden_var = 1;
}








