if file_exists("Data\save")
{
    var save_map = ds_map_create();
    
    var f = file_text_open_read("Data\save");
    
    ds_map_read(save_map,base64_decode(file_text_read_string(f)));
    
    file_text_close(f);
    
    var save_valid = true;
    
    if save_map != -1
    {
        global.save_player_x = ds_map_find_value(save_map,"player_x");
        global.save_player_y = ds_map_find_value(save_map,"player_y");
        global.save_player_room = ds_map_find_value(save_map,"player_room");
        global.save_player_gender = ds_map_find_value(save_map,"player_gender");
        
        var map_md5 = ds_map_find_value(save_map,"map_md5");
        if !is_string(map_md5)
        {
            map_md5 = "";
        }
        ds_map_delete(save_map,"map_md5");
        var gen_md5 = md5_string_unicode(ds_map_write(save_map) + global.md5_str_add);
        if map_md5 != gen_md5
        {
            save_valid = false;
        }
        ds_map_destroy(save_map);
    }
    else
    {
        save_valid = false;
    }  
    if save_valid = false
    {
        show_message("Save invalid!");
        game_restart();
        exit;
    }
    with obj_player
    {
        instance_destroy();
    }
        
    instance_create(global.save_player_x,global.save_player_y,obj_player);
    room_goto(asset_get_index(global.save_player_room));
}
else
{
    show_message("Save doesn't exist!");
}
