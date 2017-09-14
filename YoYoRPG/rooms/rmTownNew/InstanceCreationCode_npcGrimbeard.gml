SetAvatar("Grimbeard", avatarSprite);
canMove = false;

// Conversations
DialogueBegin(0);
Dialogue("I'm the weaponsmith. I smith weapons & don't like to be bothered. What's your favourite weapon?");
DialogueResponse(1, "Swords!");
DialogueResponse(2, "Axes!");

DialogueBegin(1);
Dialogue("*Hmmmph!* I'm more of an axe man myself.");

DialogueBegin(2);
Dialogue("Really? Your scrawny arms don't look like they have the strength to swing an axe.");