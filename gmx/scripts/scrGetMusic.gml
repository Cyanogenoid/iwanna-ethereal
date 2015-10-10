//gets which song is supposed to be playing for the current room

var roomSong;

switch (room)       //determines which song to play
{
    case rScreen1_1:
        roomSong = musSynesthesia
        break;
    case rScreen1_2:
        roomSong = musSynesthesia
        break;
    case rScreen1_3:
        roomSong = musSynesthesia
        break;
    case rScreen1_4:
        roomSong = musSynesthesia
        break;
    default:        //default option in case the room does not have a song set
        roomSong = -1;
        break;
}

scrPlayMusic(roomSong,true); //play the song for the current room
