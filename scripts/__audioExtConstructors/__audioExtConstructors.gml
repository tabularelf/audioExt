enum audioExtStatus {
		LOADING,
		LOADED,
		ERROR,
		REMOVED
}

function __audioExtPar(_soundID) constructor {
	__status = audioExtStatus.LOADING;
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
	
	static getFilePath = function() {
			return filePath;
	}
	
	static getSoundID = function() {
		if (isLoaded() == false) {
			load();
			return soundID;
		} else {
			return soundID;
		}
	}
	
	static getStatus = function() {
		return __status;
	}
}

function __audioExtOgg(_name, _filePath, _soundID, _preload) : __audioExtPar(_soundID) constructor {
	soundID = _soundID;
	name = _name;
	filePath = _filePath;
	fileType = "OGG";
	loaded = _preload;
	__status = audioExtStatus.LOADED;
	
	global.__audioExtSystem.oggMap[$ _name] = self;
	ds_list_add(global.__audioExtSystem.oggList, self);
	
	static unload = function(_force = false) {
		if !(isLoaded()) exit;
		if (__status == audioExtStatus.REMOVED) {
			__audioExtError("Audio struct was removed from memory!");	
		}
		if !(audio_is_playing(soundID)) || (_force == true) {
			if (isLoaded()) {
				audio_stop_sound(soundID);
				audio_destroy_stream(soundID);
				loaded = false;
			}
		} else {
			// We can't unload it so... Let's just wait.
			var _i = 0;
			repeat(ds_list_size(global.__audioExtSystem.audioUnloadList)) {
				if (global.__audioExtSystem.audioUnloadList[| _i++] == self) {
					exit;	
				}
			}
			
			ds_list_add(global.__audioExtSystem.audioUnloadList, self);
		}
	}
	
	static load = function() {
		if (isLoaded()) exit;
		if (__status == audioExtStatus.REMOVED) {
			__audioExtError("Audio struct was removed from memory!");	
		}
		
		if !(file_exists(filePath)) {
			__audioExtError("filePath " + filePath + " doesn't exist!");
			return;
		} 
		var _soundID = audio_create_stream(filePath);
		if (_soundID != -1) {
			soundID = _soundID;
			loaded = true;
		}
	}
	
	static remove = function() {
		if (soundID != -1) {
			audio_stop_sound(soundID);
			audio_destroy_stream(soundID);
			soundID = -1;
		}
		
		name = "";
		filePath = "";
		
		__status = audioExtStatus.REMOVED;
		variable_struct_remove(global.__audioExtSystem.oggMap, name);
	}
}

function __audioExtWave(_name, _buff, _soundID, _filePath = "", _is3D, _preload, _compressed = false, _cbuff = -1) : __audioExtPar(_soundID) constructor {
	bufferID = _buff;
	soundID = _soundID;
	fileType = "WAV";
	filePath = _filePath;
	name = _name;
	compressed = _compressed;
	compressedBufferID = _cbuff;
	audioIs3D = _is3D;
	loaded = _preload;
	asyncLoad = false;
	__status = audioExtStatus.LOADED;
	
	global.__audioExtSystem.wavMap[$ _name] = self;
	ds_list_add(global.__audioExtSystem.wavList, self);
	
	static getBuffer = function() {
		return bufferID;	
	}
	
	static unload = function(_force = false) {
		if !(isLoaded()) exit;
		if (__status == audioExtStatus.REMOVED) {
			__audioExtError("Audio struct was removed from memory!");	
		}
		
		if !(audio_is_playing(soundID)) || (_force == true) {
			if (isLoaded()) {
				audio_stop_sound(soundID);
				audio_free_buffer_sound(soundID);
				
				// Check for compression
				if (compressed) {
					compressedBufferID = buffer_compress(bufferID, 0, buffer_get_size(bufferID));
					if (AUDIO_EXT_DEBUG_MODE) {
						__audioExtTrace("Compressed sound buffer " + name + "!");
					}
				}
				
				buffer_delete(bufferID);
				bufferID = -1;
				soundID = -1;
				loaded = false;
			}
		} else {
			// We can't unload it so... Let's just wait.
			var _i = 0;
			var _foundSelf = false;
			repeat(ds_list_size(global.__audioExtSystem.audioUnloadList)) {
				if (global.__audioExtSystem.audioUnloadList[| _i++] == self) {
					_foundSelf = true;
					if (AUDIO_EXT_DEBUG_MODE) {
						__audioExtTrace("Found " + name + " in unload list!");
					}
					break;	
				}
			}
			
			if !(_foundSelf) {
				if (AUDIO_EXT_DEBUG_MODE) {
					__audioExtTrace("Adding " + name + " to unload list!");
				}
				ds_list_add(global.__audioExtSystem.audioUnloadList, self);
			}
		}
	}
	
	static load = function() {
		if (isLoaded()) exit;
		if (__status == audioExtStatus.REMOVED) {
			__audioExtError("Audio struct was removed from memory!");	
		}
		
		if !(file_exists(filePath)) && (compressed == false) {
				__audioExtError("filePath " + filePath + " doesn't exist!");
				return;
			} 
			
			if (compressed) {
				var _buff = buffer_decompress(compressedBufferID);
				if (AUDIO_EXT_DEBUG_MODE) {
						__audioExtTrace("Decompressed sound buffer " + name + "!");
				}
				buffer_delete(compressedBufferID);
				compressedBufferID = -1;
				bufferID = _buff;
				var _soundID = __audioExtWavBufferToAudio(_buff, audioIs3D);
				if (_soundID != -1) {
					soundID = _soundID;
					bufferID = _buff;
					loaded = true;
				} else {
					buffer_delete(_buff);
				}
			} else {
				var _buff = buffer_load(filePath);
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
		}
		
	static remove = function() {
		if (soundID != -1) {
			audio_stop_sound(soundID);
			audio_free_buffer_sound(soundID);
			soundID = -1;
		}
		
		if (bufferID != -1) {
			buffer_delete(bufferID);
			bufferID = -1;
		}
		
		if (compressedBufferID != -1) {
			buffer_delete(compressedBufferID);
			compressedBufferID = -1;
		}
		
		name = "";
		filePath = "";
		
		__status = audioExtStatus.REMOVED;
		variable_struct_remove(global.__audioExtSystem.wavMap, name);
	}
}