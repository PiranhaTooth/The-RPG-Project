//saving the player's properties
global.save_player_x = obj_player.x;
global.save_player_y = obj_player.y;
global.save_room = room_get_name(room);

//create a map for save data
var save_map = ds_map_create();

ds_map_add(save_map,"save_player_x",global.save_player_x);
ds_map_add(save_map,"save_player_y",global.save_player_y);
ds_map_add(save_map,"save_room",global.save_room);

//add md5 hash to verify saves and make them harder to hack
ds_map_add(save_map,"map_md5",md5_string_unicode(ds_map_write(save_map)+global.md5_str_add));

//save the map to a file
ds_map_secure_save(save_map,"Data\save"+string(global.save_num));

//destroy the map
ds_map_destroy(saveMap);
