function audioExtStep() {  
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
    var _i = 0;
    var _list = global.__audioExtSystem.audioUnloadList; 
    repeat(ds_list_size(_list)) {
        var _entry = _list[| _i];
        if !(audio_is_playing(_entry.soundID)) && (_entry.isLoaded() == true)  && ( _entry.__status != audioExtStatus.REMOVED) {
            _entry.unload();
            ds_list_delete(_list, _i);
            --_i;
        } else if (_entry.isLoaded() == false) || ( _entry.__status == audioExtStatus.REMOVED) {
            ds_list_delete(_list, _i);
            --_i;
        }
        ++_i;
    }
    
    var _i = 0;
    var _list = global.__audioExtSystem.oggList; 
    repeat(ds_list_size(_list)) {
        var _entry = _list[| _i];
        if (_entry.getStatus() == audioExtStatus.REMOVED) {
            _entry.unload();
            ds_list_delete(_list, _i);
            --_i;
        } 
        ++_i;
    }
    
    var _i = 0;
    var _list = global.__audioExtSystem.wavList; 
    repeat(ds_list_size(_list)) {
        var _entry = _list[| _i];
        if (_entry.getStatus() == audioExtStatus.REMOVED) {
            _entry.unload();
            ds_list_delete(_list, _i);
            --_i;
        } 
        ++_i;
    }
}