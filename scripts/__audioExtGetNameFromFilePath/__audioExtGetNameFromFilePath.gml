function __audioExtGetNameFromFilePath(_filePath) {
	var _finalSlash = string_last_pos("\\", _filePath)+1;
	return string_copy(_filePath, _finalSlash, string_last_pos(".", _filePath)-_finalSlash);	
}