///restarts the game

if (surface_exists(global.pause_surf))
    surface_free(global.pause_surf);  //free pause surface in case the game is currently paused

game_restart();
