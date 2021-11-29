/// @func audioExtSoundLoad(name/audioStruct, ...)
/// @param name/audioStruct

function audioExtSoundLoad() {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
		
	// Ensure that we've initalized first!
	__audioExtInit();
	
	var _i = 0;
	repeat(argument_count) {
			var _entry = argument[_i];
			if (is_struct(_entry)) {
				_entry.load();	
			} else if (variable_struct_exists(global.__audioExtSystem.wavMap, _entry)) {
				global.__audioExtSystem.wavMap[$ _entry].load();
			} else if (variable_struct_exists(global.__audioExtSystem.oggMap, _entry)) {
				global.__audioExtSystem.oggMap[$ _entry].load();
			} else {
				__audioExtError("Sound \"" + _entry + "\" doesn't exist!");
			}
			++_i;
	}
}