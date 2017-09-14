SetAvatar("Liam The Lazy", avatarSprite);
canMove = false;

// Conversations
DialogueBegin(0);
Dialogue("Phew!* So... thirsty... if only... I could make it to that legendary oasis!... do you know where it is?");
DialogueResponse(1, "Yeah it's not too far from here, just off to the East.");
DialogueResponse(2, "No idea, sorry.");


DialogueBegin(1);
Dialogue("Ha! I know it is! I'm just out here soaking up the rays!");

DialogueBegin(2);
Dialogue("Oh well. I suspect it's a million miles away... *uuurgh*");

