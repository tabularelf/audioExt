/// @func audioExtWavAddBuffer(buffer, alias, [is3D], [preload], [compressedInMemory], [filePath])
/// @param buffer
/// @param alias
/// @param [is3D]
/// @param [preload]
/// @param [compressedInMemory]
/// @param [filePath]

function audioExtWavAddBuffer(_buff, _name, _is3D = false, _preload = false, _compressed = false, _filePath = "") {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return undefined;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
	var _newBuff = -1;
	var _soundID = -1;
	var _cbuff = -1;
	if (_preload == true) || (_compressed == true) {
		_newBuff = buffer_create(buffer_get_size(_buff), buffer_fixed, 1);
		buffer_copy(_buff, 0, buffer_get_size(_buff), _newBuff, 0);
		if (_compressed == false) || (_preload == true){
			_soundID = __audioExtWavBufferToAudio(_newBuff, _is3D);
			if (_soundID == -1) {
				buffer_delete(_newBuff);
				return undefined;
			}
		} else if (_preload == false) {
			var _cbuff = buffer_compress(_newBuff, 0, buffer_get_size(_newBuff));
			buffer_delete(_newBuff);
			_newBuff = -1;
		}
	} 
	
	var _audioStruct = new __audioExtWave(_name, _newBuff, _soundID, _filePath, _is3D, _preload, _compressed, _cbuff);
	
	if (AUDIO_EXT_DEBUG_MODE) {
		__audioExtTrace("Added sound buffer " + _name + ".");			
	}
	
	return _audioStruct;	
}