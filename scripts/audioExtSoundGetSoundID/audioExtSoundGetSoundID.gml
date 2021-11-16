/// @func audioExtSoundGetSoundID
/// @param name

function audioExtSoundGetSoundID(_name) {
	// Ensure that we've initalized first!
	__audioExtInit();
	
	if (variable_struct_exists(global.__audioExtSystem.soundMap, _name + "OGG")) {
		return global.__audioExtSystem.soundMap[$ _name + "OGG"].getSoundID();
	}
	
	if (variable_struct_exists(global.__audioExtSystem.soundMap, _name + "WAV")) {
		return global.__audioExtSystem.soundMap[$ _name + "WAV"].getSoundID();
	}
	
	return -1;
}