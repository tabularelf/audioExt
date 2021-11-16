/// @func audioExtWavAddFile
/// @param filename
/// @param [name]
/// @param [is3D]


function audioExtWavAddFile(_fileName, _nameID = undefined, _is3D = false) {
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
	
	var _buff = buffer_load(_fileName);
	if (_buff == -1) {
		__audioExtTrace("File \"" + _fileName + "\" failed to load!");
		return undefined;
	}
	
	var _audioStruct = audioExtWavAddBuffer(_buff, _name, _is3D, _fileName);
	buffer_delete(_buff);
	
	if (_audioStruct == undefined) {
		__audioExtTrace("File \"" + _fileName + "\" failed to process!");
		buffer_delete(_buff);
		return undefined;
	}
	
	if (AUDIT_EXT_DEBUG_MODE) {
		__audioExtTrace("Added sound " + _name + " with soundID " + string(_audioStruct.getSoundID()) + ".");		
	}
	
	return _audioStruct;
}