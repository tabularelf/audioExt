enum audioExtStatus {
		LOADING,
		LOADED,
		UNLOADED,
		ERROR
}

function __audioExtPar(_soundID) constructor {
	status = audioExtStatus.LOADING;
	
	switch(audio_get_type(_soundID)) {
		case audio_mono: channel = "Mono"; break;	
		case audio_stereo: channel = "Stereo"; break;
		case audio_3d:		channel = "3D"; break;
		default: channel = undefined;
	}
	
	static getSoundID = function() {
		return soundID;	
	}
	
	static getName = function() {
		return name;
	}
	
	static getChannel = function() {
		return channel;
	}	
	
	static getFileType = function() {
		return fileType;
	}	
	
	static getFileName = function() {
			return fileName;
	}
}

function __audioExtOgg(_name, _fileName, _soundID) : __audioExtPar(_soundID) constructor {
	soundID = _soundID;
	name = _name;
	fileName = _fileName;
	fileType = "OGG";
	
	global.__audioExtSystem.oggMap[$ _name] = self;
}

function __audioExtWave(_name, _buff, _soundID, _fileName = "") : __audioExtPar(_soundID) constructor {
	bufferID = _buff;
	soundID = _soundID;
	fileType = "WAV";
	fileName = _fileName;
	name = _name;
	
	global.__audioExtSystem.wavMap[$ _name] = self;
	
	static getBuffer = function() {
		return bufferID;	
	}
}