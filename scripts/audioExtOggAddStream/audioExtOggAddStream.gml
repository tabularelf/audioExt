/// @func audioExtOggAddStream
/// @param filePath
/// @param [preload]
/// @param [alias]

function audioExtOggAddStream(_filePath, _preload = true, _nameID = undefined) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return undefined;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
	var _name = _nameID;
	if (_nameID == undefined) {
		_name = __audioExtGetNameFromFilePath(_filePath);
	}
	
	if !file_exists(_filePath) {
		__audioExtTrace("File \"" + string(_filePath) + "\" does not exist!");
		return undefined;
	}
	
	var _soundID = -1;
	if (_preload == false) {
		_soundID = audio_create_stream(_filePath);
		if (_soundID == -1) {
			__audioExtTrace("File \"" + _filePath + "\" failed to load!");
			return undefined;
		}
	}
	
	var _audioStruct = new __audioExtOgg(_name, _filePath, _soundID, _preload);
	
	if (AUDIO_EXT_DEBUG_MODE) {
		__audioExtTrace("Added stream " + _name + " with soundID " + string(_audioStruct.getSoundID()) + ".");		
	}
	
	return _audioStruct;
}