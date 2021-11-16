/// @func audioExtSoundGet
/// @param name

function audioExtSoundGet(_name) {
	// Ensure that we've initalized first!
	__audioExtInit();
	
	if (variable_struct_exists(global.__audioExtSystem.soundMap, _name + "OGG")) {
		return global.__audioExtSystem.soundMap[$ _name + "OGG"];
	}
	
	if (variable_struct_exists(global.__audioExtSystem.soundMap, _name + "WAV")) {
		return global.__audioExtSystem.soundMap[$ _name + "WAV"];
	}
	
	return undefined;
}