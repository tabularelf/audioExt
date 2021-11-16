function __audioExtGetNameFromFileName(_fileName) {
	var _finalSlash = string_last_pos("\\", _fileName)+1;
	return string_copy(_fileName, _finalSlash, string_last_pos(".", _fileName)-_finalSlash);	
}