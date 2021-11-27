/// @func audioExtSoundGetSoundID
/// @param name/audioStruct

function audioExtSoundGetSoundID(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
	if (is_struct(_name)) {
		return _name.getSoundID();	
	} else if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
		var _struct = global.__audioExtSystem.wavMap[$ _name];
		return _struct.getSoundID();
	} else if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
		var _struct = global.__audioExtSystem.oggMap[$ _name];
		return _struct.getSoundID();
	} else {
		__audioExtError("Sound \"" + _name + "\" doesn't exist!");
	}
	
	return -1;
}