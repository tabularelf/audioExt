/// @func audioExtWavScan
/// @param filePath
function audioExtWavScan(_filepath) {
		if (__AUDIO_EXT_WEB) {
			__audioExtTrace("Web is not supported at this time.");
			return -1;
		}
	
		var _file = file_find_first(_filepath + "*.wav", 0);
			
		while(_file != "") {
			audioExtWavAddFile(_filepath + _file);
			_file = file_find_next();
		}
			
		file_find_close();
}