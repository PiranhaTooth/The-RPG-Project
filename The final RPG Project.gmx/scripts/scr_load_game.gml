///scrLoadGame(loadfile)
///loads the game
///argument0 - sets whether or not to read the save file when loading the game

var load_file = argument0;

//only load save data from the save file if the script is currently set to (we should only need to load these on first load because the game stores them afterwards)
if load_file
{
    //load the save map
    var save_map;
    
    save_map = ds_map_secure_load("Data/save"+string(global.save_num));
    
    var save_valid = true; //keeps track of whether or not the save being loaded is valid
    
    if save_map != -1 //check if the save map loaded correctly
    {
        global.save_room = ds_map_find_value(save_map,"save_room");
        global.save_player_x = ds_map_find_value(save_map,"save_player_x");
        global.save_player_y = ds_map_find_value(save_map,"save_player_y");
        if is_string(global.save_room)
        {
            if !room_exists(asset_get_index(global.save_room))
            {
                save_valid = false;
            }
        }
        else
        {
            save_valid = false;
        }
        
        //load md5 string from the save map
        var map_md5 = ds_map_find_value(save_map,"map_md5");     
        
        //check if md5 is not a string in case the save was messed with or got corrupted
        if (!is_string(map_md5))
        {
            map_md5 = "";   //make it a string for the md5 comparison
        }
        
        //generate md5 string to compare with
        ds_map_delete(save_map,"map_md5");
        var gen_md5 = md5_string_unicode(ds_map_write(save_map)+global.md5_str_add);
        
        if (map_md5 != gen_md5)   //check if md5 hash is invalid
        {
            save_valid = false;
        }
        
        //destroy the map
        ds_map_destroy(save_map);
    }
    else
    {
        //save map didn't load correctly, set the save to invalid
        save_valid = false;
    }
    
    if (!save_valid) //check if the save is invalid
    {
        //save is invalid, restart the game        
        show_message("Save invalid!");        
        scr_restart_game();
        exit;
    }
}

//set game variables and set the player's position
with (obj_player) //destroy player if it exists
{
    instance_destroy();
}

instance_create(global.save_player_x,global.save_player_y,obj_player);
room_goto(asset_get_index(global.save_room));
