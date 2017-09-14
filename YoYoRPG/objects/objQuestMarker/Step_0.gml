
if (instance_exists(objPlayerCharacter))
    {
    if (!explored)
        {
        if (point_distance(x, y, objPlayerCharacter.x, objPlayerCharacter.y) < radius)
            {
            explored = true;
            displayMarker = -1;
            EventLog("AreaExplored", id);
            QuestUpdate();
            }
        }
        
    else if (point_distance(x, y, objPlayerCharacter.x, objPlayerCharacter.y) > radius)
        {
        explored = false;
        }
    }


