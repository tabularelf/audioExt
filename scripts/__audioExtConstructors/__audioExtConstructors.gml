enum audioExtStatus {
		LOADING,
		LOADED,
		UNLOADED,
		ERROR
}

function __audioExtPar(_soundID) constructor {
	status = audioExtStatus.LOADING;
	loaded = false;
	
	static isLoaded = function() {
		return loaded;
	}
	
	static getName = function() {
		return name;
	}
	
	static getFileType = function() {
		return fileType;
	}	
	
	static getFileName = function() {
			return fileName;
	}
}

function __audioExtOgg(_name, _fileName, _soundID, _preload) : __audioExtPar(_soundID) constructor {
	soundID = _soundID;
	name = _name;
	fileName = _fileName;
	fileType = "OGG";
	loaded = !_preload;
	
	global.__audioExtSystem.oggMap[$ _name] = self;
	
	static unload = function(_force = false) {
		if !(audio_is_playing(soundID)) || (_force == true) {
			audio_destroy_stream(soundID);
			loaded = false;
		} else {
			ds_list_add(global.__audioExtSystem.audioUnloadList, self);
			show_debug_message("Added to list!");
		}
	}
	
	static load = function() {
		if !(file_exists(fileName)) {
			__audioExtError("Filename " + fileName + " doesn't exist!");
			return;
		} 
		var _soundID = audio_create_stream(fileName);
		if (_soundID != -1) {
			soundID = _soundID;
			loaded = true;
		}
	}
	
	static getSoundID = function() {
		if (isLoaded() == false) {
			load();
			return soundID;
		} else {
			return soundID;
		}
	}
}

function __audioExtWave(_name, _buff, _soundID, _fileName = "", _is3D, _preload) : __audioExtPar(_soundID) constructor {
	bufferID = _buff;
	soundID = _soundID;
	fileType = "WAV";
	fileName = _fileName;
	name = _name;
	audioIs3D = _is3D;
	loaded = !_preload;
	asyncLoad = false;
	
	global.__audioExtSystem.wavMap[$ _name] = self;
	
	static getBuffer = function() {
		return bufferID;	
	}
	
	static unload = function(_force = false) {
		if !(audio_is_playing(soundID)) || (_force == true) {
			audio_free_buffer_sound(soundID);
			buffer_delete(bufferID);
			bufferID = -1;
			soundID = -1;
			loaded = false;
		} else {
			ds_list_add(global.__audioExtSystem.audioUnloadList, self);
		}
	}
	
	static load = function() {
		if !(file_exists(fileName)) {
				__audioExtError("Filename " + fileName + " doesn't exist!");
				return;
			} 
			
			var _buff = buffer_load(fileName);
			var _size = buffer_get_size(_buff);
			var _newBuff = buffer_create(_size, buffer_fixed, 1);
			buffer_copy(_buff, 0, _size, _newBuff, 0);
			var _soundID = __audioExtWavBufferToAudio(_newBuff, audioIs3D);
			if (_soundID != -1) {
				soundID = _soundID;
				bufferID = _newBuff;
				loaded = true;
			} else {
				buffer_delete(_newBuff);
			}
			
			buffer_delete(_buff);
		}
	
	static getSoundID = function() {
		if (isLoaded() == false) {
			load();
			return soundID;
		} else {
			return soundID;
		}
	}
}