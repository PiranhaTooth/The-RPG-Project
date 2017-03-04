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
        //start new game
        //room_goto(r_test);
        room_goto(r_character_select);
        scr_newsave();      
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
