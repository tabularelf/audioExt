/// @func audioExtSoundRemove
/// @param name/audioStruct
/// @param [force]
function audioExtSoundRemove(_name, _force = false) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	if (is_struct(_name)) {
		if (_name.getStatus() != audioExtStatus.REMOVED) {
			_name.remove(_force);	
		} 
	} else if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
		var _struct = global.__audioExtSystem.wavMap[$ _name];
		_struct.remove(_force);
	} else if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
		var _struct = global.__audioExtSystem.oggMap[$ _name];
		_struct.remove(_force);
	} else {
		__audioExtError("Sound \"" + _name + "\" doesn't exist!");
	}
}