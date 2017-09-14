SetSpritesScorpion();
SetAvatar("The All Powerful Scorponok", avatarSprite);
canMove = false;

// Conversations
DialogueBegin(0);
Dialogue("Yeah yeah, I'm some kind of Scorpion prophet. *adjusts zip on costume*");
DialogueResponse(1, "Please reveal the mysteries of life to me! Share your wisdom oh wise Scorpion King!");
DialogueResponse(2, "Back foul beast!");
DialogueResponse(3, "Are you the equivelent of the Wise Old Man?");
DialogueResponse(4, "You're just some sad old man in a tacky Scorpion costume aren't you?");

DialogueBegin(1);
Dialogue("Wisdom? I don't even know what day it is, son. Damn I'm hungry... *yawn*");

DialogueBegin(2);
Dialogue("Aaah! Where? *curls into a quivering ball*");

DialogueBegin(3);
Dialogue("Nah, but if it's a hermit you're looking for, I hear Jack is hiding in a cave around here somewhere...");

DialogueBegin(4);
Dialogue("You got me.");
