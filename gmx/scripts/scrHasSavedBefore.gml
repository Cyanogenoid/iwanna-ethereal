// checks whether the player has saved at the given save id before
// argument0: save id

// loop backwards for efficiency, new saves are always at the end
for (i = array_length_1d(global.saves) - 1; i >= 0; i--) {
    if (argument0 == global.saves[i]) {
        return true;
    }
}
return false;
