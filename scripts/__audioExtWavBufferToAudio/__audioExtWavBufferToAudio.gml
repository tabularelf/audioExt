function __audioExtWavBufferToAudio(_buff, _is3D = false) {
	var _header = 42;
	
	// Set Seek
	buffer_seek(_buff,buffer_seek_start,0);
	var _signature = buffer_peek(_buff,8,buffer_u32);
	
	if ((_signature & 255) == 0x57 && (_signature >> 8) & 255 == 0x41 && (_signature >> 16) & 255 == 0x56 && (_signature >> 24) & 255 == 0x45) {
	
		var _channel;
		if (_is3D == false) {
			_channel = buffer_peek(_buff,22,buffer_u16);
		} else {
			_channel = audio_3d;	
		}
		
	 var _rate = buffer_peek(_buff,24,buffer_u32);
	 var _bits_per_sample = buffer_peek(_buff,34,buffer_u16);
	 var _subchunksize = buffer_peek(_buff,40,buffer_u32);
		
		if (_is3D == false) {
				switch(_channel) {
					case 1: _channel = audio_mono; break;    
					case 2: _channel = audio_stereo; break;
			}
	}
	
	switch(_bits_per_sample) {
		case 8: _bits_per_sample = buffer_u8; break;
		case 16: _bits_per_sample = buffer_s16; break;
	}
		
	var _soundID = audio_create_buffer_sound(_buff,_bits_per_sample,_rate,_header,_subchunksize, _channel);
	return _soundID;
	
	} else {
	    // ERROR so we return nothing.
		__audioExtTrace("Invalid signature!");
	    return -1;
	}	
}