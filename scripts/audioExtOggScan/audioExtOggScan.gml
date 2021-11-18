/// @func audioExtOggScan
/// @param filePath
/// @param [preload]

function audioExtOggScan(_filePath, _preload = true) {
		if (__AUDIO_EXT_WEB) {
			__audioExtTrace("Web is not supported at this time.");
			return -1;
		}
	
		var _file = file_find_first(_filePath + "*.ogg", 0);
			
		while(_file != "") {
			audioExtOggAddStream(_filePath + _file, _preload);
			_file = file_find_next();
		}
			
		file_find_close();
}