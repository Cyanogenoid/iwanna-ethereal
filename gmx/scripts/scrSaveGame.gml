//saves the game
//argument0 - sets whether the game should save the player's current location or just save the deaths/time

//saves player's current location variables if it's set to
if (argument0)
{    
    global.saveRoom = room;
    global.savePlayerX = objPlayer.x;
    global.savePlayerY = objPlayer.y;
    global.saveGrav = global.grav;
    
    //check if player is saving inside of a wall or in the ceiling
    with (objPlayer)
    {
        if (!place_free(floor(x),y))
        {
            global.savePlayerX += 1;
        }
        
        if (!place_free(x,floor(y)))
        {
            global.savePlayerY += 1;
        }
    }
    
    for (var i = 1; i <= 8; i++)
    {
        global.saveSecretItem[i] = global.secretItem[i];
        global.saveBossItem[i] = global.bossItem[i];
    }
    
    global.saveGameClear = global.gameClear;
}

var f = file_bin_open(working_directory+"\Data\save"+string(global.savenum),1);

global.md5StrIn = "";   //initialize string for md5 hash

scrWriteBytes(f,global.death,3);
scrWriteBytes(f,global.time,3);
scrWriteBytes(f,global.timeMilli,2);

scrWriteBytes(f,global.difficulty,1);
scrWriteBytes(f,global.saveRoom,2);
scrWriteBytes(f,global.savePlayerX,3);
scrWriteBytes(f,global.savePlayerY,3);
scrWriteBytes(f,global.saveGrav + 1,1); //add 1 because we can't save negative numbers and global.saveGrav is always either -1 or 1

for (var i = 1; i <= 8; i++)
{
    scrWriteBytes(f,global.saveSecretItem[i],1);
}

for (var i = 1; i <= 8; i++)
{
    scrWriteBytes(f,global.saveBossItem[i],1);
}

scrWriteBytes(f,global.saveGameClear,1);

save_count = array_length_1d(global.saves);
scrWriteBytes(f, save_count, 4);
for (i = 0; i < save_count; i++) {
    scrWriteBytes(f, global.saves[i], 4);
}


//save md5 hash

global.md5StrIn += global.md5StrAdd;    //add something to the end of the string to make save harder to mess with
//you can also add some other stuff to the string here if you want to make this harder to predict (just make sure to make it the same in scrLoadGame)

var md5StrOut = md5_string_unicode(global.md5StrIn), tempStr;

for (var i = 0; i < 16; i++)    //write the md5 hash to the file
{
    tempStr = string_copy(md5StrOut,(i*2)+1,2);
    scrWriteBytes(f,scrHexToDec(tempStr),1);
}

global.md5StrIn = "";   //clear string since we're no longer using it


file_bin_close(f);
