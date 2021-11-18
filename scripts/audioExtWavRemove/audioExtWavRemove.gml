/// @func audioExtWavRemove
/// @param name

function audioExtWavRemove(_name) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
		var _struct = global.__audioExtSystem.wavMap[$ _name];
		if _struct.soundID != -1 {
			audio_free_buffer_sound(_struct.soundID);
		}
		
		if (_struct.bufferID != -1) {
			buffer_delete(_struct.bufferID);
		}
		
		if (_struct.compressedBufferID != -1) {
			buffer_delete(_struct.compressedBufferID);
		}
		variable_struct_remove(global.__audioExtSystem.wavMap, _name);
		
		if (AUDIO_EXT_DEBUG_MODE) {
			__audioExtTrace("Removed sound " + string(_name) + ".");	
		}
	} else {
		__audioExtError("Sound \"" + _name + "\" doesn't exist!");
	}
}