/// @description  PersistanceLog(value);
/// @function  PersistanceLog
/// @param value
//
//*****************************************************************************

ds_list_add(objGame.persistanceEvents, argument0);
show_debug_message("PersistanceLog: "+string(argument0));
