
with (other)
    {
    if (!beenHit)
        {
        myLife -= objPlayer.equippedWeapon[ITEM_EFFECT]+other.bonusDamage;
        state = STATE_STAGGER;
        staggerTimer = 30;
        face = GetOppositeDirection(objPlayerCharacter.face);
        beenHit = true;
        PlaySound(snd_GetHit);
        }
    }


