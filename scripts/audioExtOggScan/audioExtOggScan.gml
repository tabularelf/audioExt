/// @func audioExtOggScan
/// @param filePath
function audioExtOggScan(_filepath) {
		if (__AUDIO_EXT_WEB) {
			__audioExtTrace("Web is not supported at this time.");
			return -1;
		}
	
		var _file = file_find_first(_filepath + "*.ogg", 0);
			
		while(_file != "") {
			audioExtOggAddStream(_filepath + _file);
			_file = file_find_next();
		}
			
		file_find_close();
}