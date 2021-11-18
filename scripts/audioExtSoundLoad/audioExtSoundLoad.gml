/// @func audioExtSoundLoad
/// @param name

function audioExtSoundLoad(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
		
	// Ensure that we've initalized first!
	__audioExtInit();
	
    if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
        var _audioStruct = global.__audioExtSystem.oggMap[$ _name];
        _audioStruct.load();
    } else if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
        var _audioStruct = global.__audioExtSystem.wavMap[$ _name];
        audioStruct.load();
    } else {
        __audioExtError(_name + " doesn't exist!");
    }
}