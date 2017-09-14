SetSpritesNPCFemale();
SetAvatar("Charlene The Chickenchaser", avatarSprite);

// Conversations
DialogueBegin(0);
Dialogue("Hi dee ho! Ha ha ha! *frolicks* I'm out playing with chickens! Do you like chickens?");
DialogueResponse(1, "Sure! They're cute & fluffy!");
DialogueResponse(2, "Oh yes, deep fried is best!");


DialogueBegin(1);
Dialogue("They really are aren't they! Bye now!");

DialogueBegin(2);
Dialogue("... you fiend!");