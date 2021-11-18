/// @func audioExtOggScan
/// @param filePath
/// @param [preload]

function audioExtOggScan(_filepath, _preload = true) {
		if (__AUDIO_EXT_WEB) {
			__audioExtTrace("Web is not supported at this time.");
			return -1;
		}
	
		var _file = file_find_first(_filepath + "*.ogg", 0);
			
		while(_file != "") {
			audioExtOggAddStream(_filepath + _file, _preload);
			_file = file_find_next();
		}
			
		file_find_close();
}