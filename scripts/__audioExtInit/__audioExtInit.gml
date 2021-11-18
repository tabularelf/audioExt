#macro AUDIO_EXT_VERSION "0.0.2"
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
			audioUnloadList: ds_list_create()
		}
		
		if (AUDIO_EXT_SCAN_ON_START) {
			// Ogg first
			audioExtOggScan(AUDIO_EXT_DEFAULT_DIRECTORY);
			
			// Now Wav
			audioExtWavScan(AUDIO_EXT_DEFAULT_DIRECTORY);
		}
	}
}

__audioExtInit();

__audioExtTrace(AUDIO_EXT_VERSION + " initalized! Created by " + AUDIO_EXT_AUTHOR);