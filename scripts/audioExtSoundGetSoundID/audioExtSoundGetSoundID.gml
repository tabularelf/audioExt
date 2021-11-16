/// @func audioExtSoundGetSoundID
/// @param name

function audioExtSoundGetSoundID(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
	if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
		return global.__audioExtSystem.oggMap[$ _name].getSoundID();
	}
	
	if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
		return global.__audioExtSystem.wavMap[$ _name].getSoundID();
	}
	
	return -1;
}