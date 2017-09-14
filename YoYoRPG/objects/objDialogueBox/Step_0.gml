
if (waitForResponse)
    {
    // Get direction we want to scroll (1 = down, -1 = up)
    var _move;
    _move = (1*keyboard_check_pressed(KEY_DOWN)) + (-1*keyboard_check_pressed(KEY_UP));
    
    // Do movement, also handle limiting movement so we don't move out of array
    if (_move != 0)
        {
        previousSelection = selectedResponse;
        selectedResponse = median(0, selectedResponse+_move, numberOfResponses-1);
        }
    
    // Handle item availability, and skipping over hidden items or restting selection
    while (true)
        {
        if (type[section, selectedResponse] == 0)
        || (type[section, selectedResponse] == 2)
        || (type[section, selectedResponse] == 3)
            break;
        _response = response[section, selectedResponse];
        _outcome = outcome[section, selectedResponse];
        _itemArray = script_execute(response[section, selectedResponse]);
        _itemLimit = -outcome[section, selectedResponse];
        if (!-_itemLimit)
        && (InventoryFindNumberItem(_itemArray) >= _itemLimit)
            {
            if (_move = 0)
                selectedResponse = 0;
            selectedResponse += _move;
            if (selectedResponse >= numberOfResponses)
                {
                selectedResponse = previousSelection;
                break;
                }
            }
        else
            break;
        }
    }

if (keyboard_check_pressed(KEY_ACTION)
||  keyboard_check_pressed(KEY_ATTACK))
    {
    if (showPurchasedDialogue)
        showPurchasedDialogue = false;
    
    // Handle selection of response from the player
    else if (waitForResponse)
        {
        var _response, _outcome, _type;
        _response = response[section, selectedResponse];
        _outcome = outcome[section, selectedResponse];
        _type = type[section, selectedResponse];
        
        // If the selected option is a conversational response
        switch (_type)
            {
            case (0):
                Debug("Selected response "+string(selectedResponse)+": "+_response);
                Debug("Outcome of response is "+string(_outcome));
                DialogueHandleOutcome(_outcome);
                break;
                
            // Quest acceptance
            case (2):
                QuestInstanceAccept(inst);
                QuestUpdate();
                DialogueHandleOutcome(_outcome);
                break;
            
            // Quest decline
            case (3):
                DialogueHandleOutcome(_outcome);
                break;
                
            // If the selected option is a purchasable item
            case (1):
                // Get item data and the number purchased
                var _itemArray;
                _itemArray = script_execute(_response);
                purchasedItem = _itemArray;
                purchasedItem[ITEM_COUNT] = abs(_outcome);
                if (objPlayer.coins >= purchasedItem[ITEM_VALUE]*abs(_outcome))
                    {
                    showPurchasedDialogue = true;                               // Show purchase dialogue
                    InventoryAdd(purchasedItem);                                // Add item to player's inventory
                    objPlayer.coins -= purchasedItem[ITEM_VALUE]*abs(_outcome); // Take the required gems from the player
                    PlaySound(snd_StorePositiveDing);
                    }
                else
                    PlaySound(snd_StoreNegativeDing);
                break;
            }
        }
    
    // NPC is stil talking, so pay attention!
    else
        {
        // If this is the last sentence in this chain
        if (++sentence >= array_length_2d(text, section))
            {
            // If there is an oppotunity to respond
            var _respond;
            _respond = false;
            if (array_length_2d(response, section) > 0)
                {
                Debug("Response index is within range...");
                if (string(response[section, 0]) != "")
                    {
                    _respond = true;
                    numberOfResponses = array_length_2d(response, section);
                    selectedResponse = 0;
                    waitForResponse = true;
                    Debug(string(numberOfResponses)+" responses found, WAITING FOR USER!");
                    sentence = 0;
                    }
                else if (outcome[section, 0] >= 0)
                    {
                    var _outcome;
                    _outcome = outcome[section, 0];
                    sentence = 0;
                    _respond = true;
                    show_debug_message("BLANK RESPONSE, outcome: "+string(_outcome));
                    DialogueHandleOutcome(_outcome);
                    }
                }
            
            // Cannot respond
            if (!_respond)
                {
                Debug("No response to conversation, ENDING!");
                inst.wait = false;
                instance_destroy();
                }
            }
        }
    }


