switch (mpos)
{
    case 0:
    {
        //continue game
        room_goto(r_test);
        
    break;
    }
    
    case 1:
    {
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
