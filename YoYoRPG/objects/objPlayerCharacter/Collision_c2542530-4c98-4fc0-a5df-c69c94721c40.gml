
if (objPlayer.life < objPlayer.hearts)
    {
    objPlayer.life++;
    PlaySound(snd_HeartGet);
    with (other)
        instance_destroy();
    }


