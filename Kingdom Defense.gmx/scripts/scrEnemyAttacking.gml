// Attacking!
if (curFrame == sprite_get_number(curAnim)-1)
{        
   curFrame = 0;
   state = waiting;
   waitUntilAtk = myAtkSp;
   
   if( !isAir )
   curAnim = animAttacking;
   else
   curAnim = animWalking;
}

if (curFrame == atkFrame && toNextFrame == animSp)
{
    if( instance_exists(atkUnit) ) 
    {
        global.myCollider = instance_create(x,y,oCol);
        global.myCollider.sprite_index = colSprite;
        global.myCollider.myAtk = myAtk;
        global.myCollider.myLuck = myLuck;
        global.myCollider.myObjAtk = myObjAtk;
        
        with atkUnit 
        {
            sound_play(soDamageNormal);
            scrActorDamage(self,global.myCollider,0,0,0,true,c_red);
        }
        
        with global.myCollider 
        {
           instance_destroy();
        }    
    }
}    
