switch (mpos)
{
    case 0:
    {
        if file_exists("Data\save")
        {
            scr_loadgame();
        }
    break;
    }
    
    case 1:
    {
        room_goto(r_test);
        scr_newsave();
        //start new game        
        break;
    }
    
    case 2:
    {
        //options        
        break;
    }
    
    case 3:
    {
        //quit game
        game_end();        
        break;
    }
    
    default: break;
}
