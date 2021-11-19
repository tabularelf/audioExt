/// @func audioExtWavAddFile
/// @param filePath
/// @param [is3D]
/// @param [preload]
/// @param [compressedInMemory]
/// @param [alias]


function audioExtWavAddFile(_filePath, _is3D = false, _preload = false, _compressed = false, _nameID = undefined) {
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
	
	var _buff = -1;
	if (_preload == true) || (_compressed == true) {
		_buff = buffer_load(_filePath);
		if (_buff == -1) {
			__audioExtTrace("File \"" + _filePath + "\" failed to load!");
			return undefined;
		}
	} 
	
	var _audioStruct = audioExtWavAddBuffer(_buff, _name, _is3D, _preload, _compressed, _filePath);
	if (buffer_exists(_buff)) {
		buffer_delete(_buff);
	}
	
	if (_audioStruct == undefined) {
		__audioExtTrace("File \"" + _filePath + "\" failed to process!");
		if (buffer_exists(_buff)) {
			buffer_delete(_buff);
		}
		return undefined;
	}
	
	if (AUDIO_EXT_DEBUG_MODE) {
		__audioExtTrace("Added sound " + _name + ".");		
	}
	
	return _audioStruct;
}