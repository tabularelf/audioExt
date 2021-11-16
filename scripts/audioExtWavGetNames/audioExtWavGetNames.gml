// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function audioExtWavGetNames() {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return -1;
	}
	
	return variable_struct_get_names(global.__audioExtSystem.wavMap);
}