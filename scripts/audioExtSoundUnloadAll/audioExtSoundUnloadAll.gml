/// @func audioExtSoundUnloadAll([force])
/// @param [force]

function audioExtSoundUnloadAll(_force = false) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
    var _list = global.__audioExtSystem.audioLoadList; 
	repeat(ds_list_size(_list)) {
		var _entry = _list[| 0];
		if (_entry.loaded) {
			_entry.unload(_force);
		}
		ds_list_delete(_list, 0);
	}
}