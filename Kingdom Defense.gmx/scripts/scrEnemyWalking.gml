slotNearMePrev = slotNearMe;
slotNearMe = instance_nearest(x,y,oSlot);

if( !isAir && instance_exists(slotNearMePrev) && instance_exists(slotNearMe) && !instance_exists(slotNearMe.myObject) )
{
    if( slotNearMePrev.x < bbox_left && bbox_left > slotNearMe.x  )
    {
        global.slotCheck = slotNearMe;
        global.delSlot = true;
        
        with oUnit
        {
            if( x > global.slotCheck.x )
            global.delSlot = false;
        }
        
        if( global.delSlot )
        slotNearMe.unlocked = false;
    }
}

scrEnemyCheckTargets();
    
if ( instance_exists(atkUnit) )
{      
    global.me = id;
    
    state = waiting;
    curAnim = animAttacking;
    speed = 0;
    curFrame = 0; 
} 