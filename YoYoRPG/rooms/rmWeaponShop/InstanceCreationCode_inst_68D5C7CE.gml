SetAvatar("Shopkeeper Dadio", avatarSprite);
// AI settings
canMove = false;

// Conversations
DialogueBegin(0);
Dialogue("You looking to buy some nifty stuff? I have lots of nifty things!");
DialogueResponse(3, "I'd like to look at your selection please.");
DialogueResponse(1, "I only want the free stuff, come on!");
DialogueResponse(2, "You greedy shop keeper, you only care about money!");

DialogueBegin(1);
Dialogue("If you want free stuff, I'll have to see your loyalty card!");

DialogueBegin(2);
Dialogue("Not true! I also care about my stupidly large collection of questionable figurines!");

DialogueBegin(3);
Dialogue("By all means, I have nothing to hide!");

DialogueItem(ItemGetLifePotion, 1);
DialogueItem(ItemGetLifePotion, 5);
DialogueItem(ItemGetLifePotion, 10);
DialogueResponse(-1, "I've seen enough.");
