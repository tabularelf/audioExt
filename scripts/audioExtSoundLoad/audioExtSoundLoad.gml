/// @func audioExtSoundLoad
/// @param name/audioStruct

function audioExtSoundLoad(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
		
	// Ensure that we've initalized first!
	__audioExtInit();
	
    if (is_struct(_name)) {
		_name.load();	
	} else if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
		global.__audioExtSystem.wavMap[$ _name].load();
	} else if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
		global.__audioExtSystem.oggMap[$ _name].load();
	} else {
		__audioExtError("Sound \"" + _name + "\" doesn't exist!");
	}
}