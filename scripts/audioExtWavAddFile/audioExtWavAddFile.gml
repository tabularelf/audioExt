/// @func audioExtWavAddFile
/// @param filename
/// @param [is3D]
/// @param [preload]
/// @param [compressed_in_memory]
/// @param [name]


function audioExtWavAddFile(_fileName, _is3D = false, _preload = true, _compressed = false, _nameID = undefined) {
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
	
	var _buff = -1;
	if (_preload == false) || (_compressed == true) {
		_buff = buffer_load(_fileName);
		if (_buff == -1) {
			__audioExtTrace("File \"" + _fileName + "\" failed to load!");
			return undefined;
		}
	} /*else if (_compressed) {
		_buff = buffer_load(_fileName);
		var _cbuff = buffer_compress(_buff);
	}*/
	
	var _audioStruct = audioExtWavAddBuffer(_buff, _name, _is3D, _preload, _compressed, _fileName);
	if (buffer_exists(_buff)) {
		buffer_delete(_buff);
	}
	
	if (_audioStruct == undefined) {
		__audioExtTrace("File \"" + _fileName + "\" failed to process!");
		if (buffer_exists(_buff)) {
			buffer_delete(_buff);
		}
		return undefined;
	}
	
	if (AUDIO_EXT_DEBUG_MODE) {
		__audioExtTrace("Added sound " + _name + " with soundID " + string(_audioStruct.getSoundID()) + ".");		
	}
	
	return _audioStruct;
}