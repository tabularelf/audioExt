/// @func audioExtSoundExists
/// @param name

function audioExtSoundExists(_name) {
	// Ensure that we've initalized first!
	__audioExtInit();
	
	if (variable_struct_exists(global.__audioExtSystem, _name + "OGG") || variable_struct_exists(global.__audioExtSystem, _name + "WAV")) {
		return true;
	}
	
	return false;
}