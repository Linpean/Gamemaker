
// Some machines may treat tiles differently with interpolation on (we'll switch it back on for large scaled images etc.)
texture_set_interpolation(false);

// Variables for game saving
lastCheckpointRoom = room;
persistanceEvents = ds_list_create();

// Variables for pausing the game
isPaused = false;       // Game is actually paused
userPaused = false;     // User commanded pause
forcePaused = true;     // Something forced pause

// Setup water animation
AnimationInit(0, 10, Animation.loop, bckAnimationWater1, bckAnimationWater2, bckAnimationWater3, bckAnimationWater4, bckAnimationWater5);
AnimationOrder(0, 1, 2, 3, 2, 1, 4, 5, 4);

// Setup flower animation
AnimationInit(1, 30, Animation.loop, bckAnimationFlowers1, bckAnimationFlowers2);
AnimationOrder(1, 1, 2);

// Setup torch animation
AnimationInit(2, 10, Animation.loop, bckAnimationTorch1, bckAnimationTorch2, bckAnimationTorch3, bckAnimationTorch4, bckAnimationTorch5);
AnimationOrder(2, 1, 2, 3, 4, 5);


