function audioExtSoundUnload(_name, _force = false) {
    if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
        var _audioStruct = global.__audioExtSystem.oggMap[$ _name];
        _audioStruct.unload(_force);
    } else if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
        var _audioStruct = global.__audioExtSystem.wavMap[$ _name];
        _audioStruct.unload(_force);
    } else {
        __audioExtError(_name + " doesn't exist!");
    }
}