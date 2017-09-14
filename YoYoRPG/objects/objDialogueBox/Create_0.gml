
DialogueSetDefaults();

inst = -1;
section = 0;
sentence = 0;
waitForResponse = false;
numberOfResponses = 0;
selectedResponse = 0;
previousSelection = 0;          // When navigating responses, this was the previous selection
selectionY = 0;
showPurchasedDialogue = false;  // Show item that we just purchased
purchasedItem = -1;
alignment = Alignment.top;

// Create a surface, used for simpler drawing of text (specifically cutting it off when scrolling)
textSurface = surface_create(512, 96);


