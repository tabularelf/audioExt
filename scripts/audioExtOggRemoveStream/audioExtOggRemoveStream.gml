/// @func audioExtOggRemove
/// @param name

function audioExtOggRemoveStream(_name) {
	if (variable_struct_exists(global.__audioExtSystem.soundMap, _name + "OGG")) {
		var _struct = global.__audioExtSystem.soundMap[$ _name  + "OGG"];
		audio_destroy_stream(_struct.soundID);
		variable_struct_remove(global.__audioExtSystem.soundMap, _name + "OGG");
		
		if (AUDIT_EXT_DEBUG_MODE) {
			__audioExtTrace("Removed sound stream " + string(_name) + ".");	
		}
	}
}