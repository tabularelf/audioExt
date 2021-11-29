#macro AUDIO_EXT_VERSION "v0.0.3"
#macro AUDIO_EXT_AUTHOR "TabularElf - https://tabelf.link/"

#macro __AUDIO_EXT_WEB (os_browser != browser_not_a_browser) 

function __audioExtInit() {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	static _initated = false;
	if !(_initated) {
		_initated = true;
		global.__audioExtSystem = {
			wavMap: {},
			oggMap: {},
			audioUnloadList: ds_list_create(),
			oggList: ds_list_create(),
			wavList: ds_list_create(),
			audioLoadList: ds_list_create()
		}
		
		if (AUDIO_EXT_SCAN_ON_START) {
			// Ogg first
			audioExtOggScan(AUDIO_EXT_DEFAULT_DIRECTORY, AUDIO_EXT_PRELOAD_ON_START);
			
			// Now Wav
			audioExtWavScan(AUDIO_EXT_DEFAULT_DIRECTORY, AUDIO_EXT_PRELOAD_ON_START, AUDIO_EXT_COMPRESS_ON_START);
		}
	}
}

__audioExtInit();

__audioExtTrace(AUDIO_EXT_VERSION + " initalized! Created by " + AUDIO_EXT_AUTHOR);