
if (transition > 0)
    {
    transition -= 1/steps;
    if (transition <= 0)
        {
        if (fadeOut) room_goto(destRoom);   // Fade out has finished
        else         instance_destroy();    // Fade in has finished, destroy!
        transition = 0;                     // Transition to 0, to avoid... something
        }
    }


