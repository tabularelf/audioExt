/// @func audioExtSoundGet
/// @param name

function audioExtSoundGet(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return undefined;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
	if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
		return global.__audioExtSystem.oggMap[$ _name];
	}
	
	if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
		return global.__audioExtSystem.wavMap[$ _name];
	}
	
	return undefined;
}