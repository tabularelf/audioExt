/// @func audioExtSoundIsLoaded
/// @param name

function audioExtSoundIsLoaded(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
    if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
        var _audioStruct = global.__audioExtSystem.oggMap[$ _name];
        return _audioStruct.isLoaded();
    } else if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
        var _audioStruct = global.__audioExtSystem.wavMap[$ _name];
        return _audioStruct.isLoaded();
    } else {
        __audioExtError(_name + " doesn't exist!");
    }
}