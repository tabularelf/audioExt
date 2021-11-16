function __audioExtPar() constructor {
	static getSoundID = function() {
		return soundID;	
	}
	
	static getName = function() {
		return name;
	}
	
	static getType = function() {
		return type;
	}	
	
	static getFileType = function() {
		return fileType;
	}	
	
	static getFileName = function() {
			return fileName;
	}
}

function __audioExtOgg(_name, _fileName, _soundID) : __audioExtPar() constructor {
	soundID = _soundID;
	name = _name;
	fileName = _fileName;
	fileType = "OGG";
	
	switch(audio_get_type(_soundID)) {
		case audio_mono: type = "Mono"; break;	
		case audio_stereo: type = "Stereo"; break;
		default: type = undefined;
	}
	
	global.__audioExtSystem.soundMap[$ _name + "OGG"] = self;
}

function __audioExtWave(_name, _buff, _soundID, _fileName = "") : __audioExtPar() constructor {
	bufferID = _buff;
	soundID = _soundID;
	fileType = "WAV";
	fileName = _fileName;
	switch(audio_get_type(_soundID)) {
		case audio_mono: type = "Mono"; break;	
		case audio_stereo: type = "Stereo"; break;
		case audio_3d:		type = "3D"; break;
		default: type = undefined;
	}
	name = _name;
	global.__audioExtSystem.soundMap[$ _name + "WAV"] = self;
	
	static getBuffer = function() {
		return bufferID;	
	}
}