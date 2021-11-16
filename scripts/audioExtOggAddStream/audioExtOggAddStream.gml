/// @func audioExtOggAddStream
/// @param filename
/// @param [name]

function audioExtOggAddStream(_fileName, _nameID = undefined) {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return undefined;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
	var _name = _nameID;
	if (_nameID == undefined) {
		_name = __audioExtGetNameFromFileName(_fileName);
	}
	
	if !file_exists(_fileName) {
		__audioExtTrace("File \"" + string(_fileName) + "\" does not exist!");
		return undefined;
	}
	
	var _soundID = audio_create_stream(_fileName);
	if (_soundID == -1) {
		__audioExtTrace("File \"" + _fileName + "\" failed to load!");
		return undefined;
	}
	
	var _audioStruct = new __audioExtOgg(_name, _fileName, _soundID);
	
	if (AUDIO_EXT_DEBUG_MODE) {
		__audioExtTrace("Added stream " + _name + " with soundID " + string(_audioStruct.getSoundID()) + ".");		
	}
	
	return _audioStruct;
}