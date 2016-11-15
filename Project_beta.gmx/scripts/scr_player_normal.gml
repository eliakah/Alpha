scr_getInputs();

//reaction to movements
move = key_left + key_right;
//hsp = move * movespeed;
if(vsp < 20) vsp += grav;



//acceleration code

if(!keyboard_check(vk_right)&&!keyboard_check(vk_left) && (place_meeting(x,y+1, obj_wall))){
hsp -=(frict * sign(hsp))


//error checking to ensure player stops
if(hsp >= -.5 && hsp <= .5) hsp = 0;
}

//full movement when on ground
if((place_meeting(x,y+1, obj_wall))){
doublejump = 1; //restore double jump when touching ground

if(keyboard_check(vk_left)){
if(hsp > -MAX_SPEED) hsp -=acc;
facing = -1;
}

if(keyboard_check(vk_right)){
if(hsp < MAX_SPEED) hsp +=acc;
facing = 1;
}
}

else{ //less conttrol while in the air
if(keyboard_check(vk_left)){
if(hsp > -MAX_SPEED) hsp -=acc/2;
facing = -1;
}

if(keyboard_check(vk_right)){
if(hsp < MAX_SPEED) hsp +=acc/2;
facing = 1;
}

}


/*
Obsolete due to platforms: If you jump up throug a platform to be exactly
one pixel above it, this code will run, and will set the verticle speed to be zero
or jumpspeed, causing you to stick to the platform as you jump up through it instead of 
continuing with your momentum, looking unnatural.
if (place_meeting(x,y+1,obj_wall)){
    vsp = key_jump * -jumpspeed
}
*/

/*
This if will only set verticle speed when the jump key is pressed, avoiding the problem above.
*/
if (place_meeting(x,y+1,obj_wall)){
    if(key_jump) vsp = -jumpspeed * 1.5
}

//double jump script
else if (!place_meeting(x,y+1,obj_wall) && doublejump){
    if(key_jump){
     vsp = -jumpspeed * 1.5
    doublejump=0;
    effect_create_above(ef_ring, x, y, 2, c_white)
    }
}


scr_collideAndMove();