/// @func audioExtWavRemove
/// @param name

function audioExtWavRemove(_name) {
	if (variable_struct_exists(global.__audioExtSystem.soundMap, _name  + "WAV")) {
		var _struct = global.__audioExtSystem.soundMap[$ _name  + "WAV"];
		audio_free_buffer_sound(_struct.soundID);
		buffer_delete(_struct.bufferID);
		variable_struct_remove(global.__audioExtSystem.soundMap, _name  + "WAV");
		
		if (AUDIT_EXT_DEBUG_MODE) {
			__audioExtTrace("Removed sound " + string(_name) + ".");	
		}
	}
}