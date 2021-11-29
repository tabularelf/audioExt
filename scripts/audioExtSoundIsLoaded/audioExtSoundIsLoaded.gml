/// @func audioExtSoundIsLoaded
/// @param name/audioStruct

function audioExtSoundIsLoaded(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
	var _result = false;
    if (is_struct(_name)) {
		return _name.isLoaded();	
	} else if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
		return global.__audioExtSystem.wavMap[$ _name].isLoaded();	
	} else if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
		return global.__audioExtSystem.oggMap[$ _name].isLoaded();	
	} else {
		__audioExtError("Sound \"" + _name + "\" doesn't exist!");
	}
}