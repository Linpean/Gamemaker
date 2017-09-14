
// Select which music track should be playing
//switch (room)
    //{
    //case (rmTown):    currentTrack = musicTown; break;
    //case (rmForest):  currentTrack = musicForest; break;
    //case (rmDungeon): currentTrack = musicDungeon; break;
    //}


// If there is a track selected
if (currentTrack != -1)
    {
    // If we switched track while another track is still fading out
    if (currentTrack != previousTrack) && (endFade >= 0)
        {
        audio_stop_sound(fadeTrack);
        show_debug_message("Audio: Stopped early!");
        }
    
    // The correct track is not yet playing
    if (!audio_is_playing(currentTrack))
        {
        // Fade out previous track
        if (previousTrack != -1)
            {
            audio_sound_gain(previousTrack, 0.0, 1000);
            fadeTrack = previousTrack;
            endFade = room_speed;
            show_debug_message("Audio: Fading OUT previous track!");
            }
            
        // Fade in new track
        audio_play_sound(currentTrack, 0, true);
        audio_sound_gain(currentTrack, 0.0, 0);
        audio_sound_gain(currentTrack, 1.0, 1000);
        show_debug_message("Audio: Fading IN new track!");
        
        // Remember, so we can fade it out later
        previousTrack = currentTrack;
        }
    }

// The track fading out has finished, stop it
if (endFade-- == 0)
    audio_stop_sound(fadeTrack);


