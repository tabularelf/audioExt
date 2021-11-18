function audioExtSoundUnload(_name) {
    if (variable_struct_exists(global.__audioExtSystem.oggMap, _name)) {
        var _audioStruct = global.__audioExtSystem.oggMap[$ _name];
        _audioStruct.load();
    } else if (variable_struct_exists(global.__audioExtSystem.wavMap, _name)) {
        var _audioStruct = global.__audioExtSystem.wavMap[$ _name];
        audioStruct.load();
    } else {
        __audioExtError(_name + " doesn't exist!");
    }
}