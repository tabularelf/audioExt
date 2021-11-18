function audioExtStep() {  
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
    var _i = 0;
    var _unloadList = global.__audioExtSystem.audioUnloadList; 
    repeat(ds_list_size(_unloadList)) {
        var _entry = _unloadList[| _i];
        if !(audio_is_playing(_entry.soundID)) && (_entry.isLoaded() == true) {
            _entry.unload();
            ds_list_delete(_unloadList, _i);
            --_i;
        } else if (_entry.isLoaded() == false) {
            ds_list_delete(_unloadList, _i);
            --_i;
        }
        ++_i;
    }
}