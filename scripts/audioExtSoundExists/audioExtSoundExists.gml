/// @func audioExtSoundExists
/// @param name

function audioExtSoundExists(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
	if (variable_struct_exists(global.__audioExtSystem.oggMap, _name) || variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
		return true;
	}
	
	return false;
}