// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // objGame
global.__objectDepths[1] = 0; // objPlayerCharacter
global.__objectDepths[2] = 0; // objPlayerStrike
global.__objectDepths[3] = 0; // parMortal
global.__objectDepths[4] = 0; // parMobile
global.__objectDepths[5] = 0; // parNpc
global.__objectDepths[6] = 0; // parEnemy
global.__objectDepths[7] = 0; // objChicken
global.__objectDepths[8] = 0; // objScorpion
global.__objectDepths[9] = 0; // objSnowScorpions
global.__objectDepths[10] = 0; // objSnowMonster
global.__objectDepths[11] = 0; // objDesertScorpion
global.__objectDepths[12] = 0; // objForestMonster
global.__objectDepths[13] = 0; // objSkraggleKlaw
global.__objectDepths[14] = 0; // objTestNpc
global.__objectDepths[15] = 0; // objTemporary
global.__objectDepths[16] = 0; // parObstacleFull
global.__objectDepths[17] = 0; // parObstacle
global.__objectDepths[18] = 0; // objWallSquare
global.__objectDepths[19] = 0; // objGrass
global.__objectDepths[20] = 0; // objWallAngle
global.__objectDepths[21] = 0; // objGrassSnow
global.__objectDepths[22] = 0; // objCactus
global.__objectDepths[23] = 0; // parCollectible
global.__objectDepths[24] = 0; // objGreenGem
global.__objectDepths[25] = 0; // objBlueGem
global.__objectDepths[26] = 0; // objPot
global.__objectDepths[27] = 0; // objPurpleGem
global.__objectDepths[28] = 0; // objLifeHeart
global.__objectDepths[29] = 0; // parInteract
global.__objectDepths[30] = 0; // objSign
global.__objectDepths[31] = 0; // objChest
global.__objectDepths[32] = 0; // parDoor
global.__objectDepths[33] = 0; // objDoor
global.__objectDepths[34] = 0; // objDialogueBox
global.__objectDepths[35] = 0; // objCaveEntrance
global.__objectDepths[36] = 0; // objCaveEntranceSnow
global.__objectDepths[37] = 0; // objDoorDungeon
global.__objectDepths[38] = 0; // objCaveEntranceDesert
global.__objectDepths[39] = 0; // objDoorBlanker
global.__objectDepths[40] = 0; // objDoorHouse
global.__objectDepths[41] = 0; // objTorch
global.__objectDepths[42] = 0; // objBlank
global.__objectDepths[43] = 0; // objQuestManager
global.__objectDepths[44] = 0; // parPauseMenu
global.__objectDepths[45] = 0; // objQuestMarker
global.__objectDepths[46] = 0; // objOptions
global.__objectDepths[47] = 0; // objSaveLoad
global.__objectDepths[48] = 10; // objTitle
global.__objectDepths[49] = 0; // objInventory
global.__objectDepths[50] = 0; // objCharacterSelect
global.__objectDepths[51] = -1000; // objPickupNotification
global.__objectDepths[52] = 0; // objNewObject
global.__objectDepths[53] = 0; // objMusicPlayer
global.__objectDepths[54] = 0; // objSplashScreen
global.__objectDepths[55] = 0; // objConstants
global.__objectDepths[56] = 0; // objCheckpoint
global.__objectDepths[57] = 10; // objNewGame
global.__objectDepths[58] = 0; // objTransition
global.__objectDepths[59] = 10; // objLoadGame
global.__objectDepths[60] = -100; // objConfirmation
global.__objectDepths[61] = 0; // objDeathScreen
global.__objectDepths[62] = 0; // objPlayer


global.__objectNames[0] = "objGame";
global.__objectNames[1] = "objPlayerCharacter";
global.__objectNames[2] = "objPlayerStrike";
global.__objectNames[3] = "parMortal";
global.__objectNames[4] = "parMobile";
global.__objectNames[5] = "parNpc";
global.__objectNames[6] = "parEnemy";
global.__objectNames[7] = "objChicken";
global.__objectNames[8] = "objScorpion";
global.__objectNames[9] = "objSnowScorpions";
global.__objectNames[10] = "objSnowMonster";
global.__objectNames[11] = "objDesertScorpion";
global.__objectNames[12] = "objForestMonster";
global.__objectNames[13] = "objSkraggleKlaw";
global.__objectNames[14] = "objTestNpc";
global.__objectNames[15] = "objTemporary";
global.__objectNames[16] = "parObstacleFull";
global.__objectNames[17] = "parObstacle";
global.__objectNames[18] = "objWallSquare";
global.__objectNames[19] = "objGrass";
global.__objectNames[20] = "objWallAngle";
global.__objectNames[21] = "objGrassSnow";
global.__objectNames[22] = "objCactus";
global.__objectNames[23] = "parCollectible";
global.__objectNames[24] = "objGreenGem";
global.__objectNames[25] = "objBlueGem";
global.__objectNames[26] = "objPot";
global.__objectNames[27] = "objPurpleGem";
global.__objectNames[28] = "objLifeHeart";
global.__objectNames[29] = "parInteract";
global.__objectNames[30] = "objSign";
global.__objectNames[31] = "objChest";
global.__objectNames[32] = "parDoor";
global.__objectNames[33] = "objDoor";
global.__objectNames[34] = "objDialogueBox";
global.__objectNames[35] = "objCaveEntrance";
global.__objectNames[36] = "objCaveEntranceSnow";
global.__objectNames[37] = "objDoorDungeon";
global.__objectNames[38] = "objCaveEntranceDesert";
global.__objectNames[39] = "objDoorBlanker";
global.__objectNames[40] = "objDoorHouse";
global.__objectNames[41] = "objTorch";
global.__objectNames[42] = "objBlank";
global.__objectNames[43] = "objQuestManager";
global.__objectNames[44] = "parPauseMenu";
global.__objectNames[45] = "objQuestMarker";
global.__objectNames[46] = "objOptions";
global.__objectNames[47] = "objSaveLoad";
global.__objectNames[48] = "objTitle";
global.__objectNames[49] = "objInventory";
global.__objectNames[50] = "objCharacterSelect";
global.__objectNames[51] = "objPickupNotification";
global.__objectNames[52] = "objNewObject";
global.__objectNames[53] = "objMusicPlayer";
global.__objectNames[54] = "objSplashScreen";
global.__objectNames[55] = "objConstants";
global.__objectNames[56] = "objCheckpoint";
global.__objectNames[57] = "objNewGame";
global.__objectNames[58] = "objTransition";
global.__objectNames[59] = "objLoadGame";
global.__objectNames[60] = "objConfirmation";
global.__objectNames[61] = "objDeathScreen";
global.__objectNames[62] = "objPlayer";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for