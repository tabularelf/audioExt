/// @func audioExtOggRemove
/// @param name

function audioExtOggRemoveStream(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
		var _struct = global.__audioExtSystem.oggMap[$ _name];
		audio_destroy_stream(_struct.soundID);
		variable_struct_remove(global.__audioExtSystem.oggMap, _name);
		
		if (AUDIO_EXT_DEBUG_MODE) {
			__audioExtTrace("Removed sound stream " + string(_name) + ".");	
		}
	} else {
		__audioExtError("Sound Stream \"" + _name + "\" doesn't exist!");	
	}
}