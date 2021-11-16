/// @func audioExtWavAddBuffer
/// @param buffer
/// @param name
/// @param [is3D]

function audioExtWavAddBuffer(_buff, _name, _is3D = false, _fileName = "") {
	if (__AUDIO_EXT_WEB) {
		__audioExtTrace("Web is not supported at this time.");
		return undefined;
	}
	
	// Ensure that we've initalized first!
	__audioExtInit();
	
	var _newBuff = buffer_create(buffer_get_size(_buff), buffer_fixed, 1);
	buffer_copy(_buff, 0, buffer_get_size(_buff), _newBuff, 0);
	var _soundID = __audioExtWavBufferToAudio(_newBuff, _is3D);
	
	if (_soundID == -1) {
		buffer_delete(_newBuff);
		return undefined;
	}
	
	var _audioStruct = new __audioExtWave(_name, _newBuff, _soundID, _fileName);
	
	if (AUDIO_EXT_DEBUG_MODE) {
		__audioExtTrace("Added sound buffer " + _name + " with soundID " + string(_audioStruct.getSoundID()) + ".");			
	}
	
	return _audioStruct;	
}