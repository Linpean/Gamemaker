
if (global.loadGame)
    {
    global.loadGame = false;
    lastCheckpointRoom = room;
    
    if (instance_exists(objCheckpoint))
        {
        objPlayerCharacter.x = objCheckpoint.x;
        objPlayerCharacter.y = objCheckpoint.y;
        }
    }

else
    {
    if (instance_exists(objCheckpoint))
        {
        lastCheckpointRoom = room;
        SaveGame(global.autoFile);
        }
    }


