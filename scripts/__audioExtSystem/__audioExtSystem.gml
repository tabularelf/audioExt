#macro AUDIO_EXT_VERSION "0.0.1"
#macro AUDIO_EXT_AUTHOR "TabularElf - https://tabelf.link/"

function __audioExtInit() {
	static _initated = false;
	if !(_initated) {
		_initated = true;
		global.__audioExtSystem = {
			soundMap: {}
		}
	}
}

__audioExtInit();

__audioExtTrace(AUDIO_EXT_VERSION + " initalized! Created by " + AUDIO_EXT_AUTHOR);