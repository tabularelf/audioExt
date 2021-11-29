/// @func audioExtSoundClear

function audioExtSoundClear() {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	var _oggList  = global.__audioExtSystem.oggList;
	var _wavList  = global.__audioExtSystem.wavList;
	
	// Loop through wav and ogg
	var _i = 0;
	repeat(ds_list_size(_oggList)) {
		_oggList[| 0].remove();
	}
	
	repeat(ds_list_size(_wavList)) {
		_wavList[| 0].remove();
	}
	
	ds_list_clear(global.__audioExtSystem.audioUnloadList);
	
	// Clear maps
	global.__audioExtSystem.oggMap = {};
	global.__audioExtSystem.wavMap = {};
}