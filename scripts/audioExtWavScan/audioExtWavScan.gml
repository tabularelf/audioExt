/// @func audioExtWavScan
/// @param filePath
/// @param [preload]
/// @param [compressed_in_memory]

function audioExtWavScan(_filePath, _preload = true, _compressed = false) {
		if (__AUDIO_EXT_WEB) {
			__audioExtTrace("Web is not supported at this time.");
			return -1;
		}
	
		var _file = file_find_first(_filePath + "*.wav", 0);
			
		while(_file != "") {
			audioExtWavAddFile(_filePath + _file, false, _preload, _compressed);
			_file = file_find_next();
		}
			
		file_find_close();
}