//
//  This object handles music changes that can be defined per room (See step event).
//  This object is also easily portable to another project, as the only connection is
//  room and music resource names, just change these for a different project!
//

currentTrack = -1;      // The track that should currently be playing
previousTrack = -1;     // The track that was playing before the current one
fadeTrack = -1;         // The track that we have stopped playing and are fading out
endFade = -1;           // Holds number of steps we've been fading

// NOTE:
// Actually fading audio is measured in miliseconds,
// where our timer measures in steps.
// So remember, (steps)room_speed and (miliseconds)1000 both equal 1 second


