/// @func audioExtSoundRemove
/// @param name/audioStruct

function audioExtSoundRemove() {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	var _i = 0;
	repeat(argument_count) {
		var _entry = argument[_i];
		if (is_struct(_entry)) {
			if (_entry.getStatus() != audioExtStatus.REMOVED) {
				_entry.remove();	
			} 
		} else if (variable_struct_exists(global.__audioExtSystem.wavMap, _entry)) {
			global.__audioExtSystem.wavMap[$ _entry].remove();
		} else if (variable_struct_exists(global.__audioExtSystem.oggMap, _entry)) {
			global.__audioExtSystem.oggMap[$ _entry].remove();
		} else {
			__audioExtError("Sound \"" + _entry + "\" doesn't exist!");
		}
	}
}