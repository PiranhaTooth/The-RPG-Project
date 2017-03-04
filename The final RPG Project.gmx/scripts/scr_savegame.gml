global.save_player_room = room_get_name(room);
global.save_player_x = obj_player.x;
global.save_player_y = obj_player.y;
global.save_player_gender = obj_player.gender;

var save_map = ds_map_create();

ds_map_add(save_map,"player_x",global.save_player_x);
ds_map_add(save_map,"player_y",global.save_player_y);
ds_map_add(save_map,"player_room",global.save_player_room);
ds_map_add(save_map,"player_gender",global.save_player_gender);

ds_map_add(save_map,"map_md5",md5_string_unicode(ds_map_write(save_map) + global.md5_str_add));

var f = file_text_open_write("Data\save");
file_text_write_string(f,base64_encode(ds_map_write(save_map)));
file_text_close(f);

ds_map_destroy(save_map);
