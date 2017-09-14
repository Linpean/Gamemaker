SetAvatar("Talkative Trevor", avatarSprite);
canMove = false;

// Conversations
DialogueBegin(0);
Dialogue("Hi! I'm Trev! I'm just doing a spot of fishing here on the pier! Want to chat for a bit?");
DialogueResponse(1, "Sure I'd love a chat.");
DialogueResponse(2, "A chat? I don't have time for such things!");
DialogueResponse(3, "You smell of rotton fish. Good day to you sir.");

DialogueBegin(1);
Dialogue("Good, I do so enjoy a long hearty chat! Did you know that thousands of years ago.... zzz *falls asleep*");

DialogueBegin(2);
Dialogue("Too bad, too bad... everyone's always in a rush these days.");

DialogueBegin(3);
Dialogue("Why you little brat!");
