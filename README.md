# audioExt v0.0.1
 Sound External Loader/Unloader Manager for GameMaker Studio 2.3.1+
 
 This library helps load/unload, assign and manage ogg/wav files into neat lil structs to quickly utilize.

Note: Only wavs currently support 3D audio. Ogg files are streamed in and do not have an option for 3D audio support.
Additionally: As of 2.3.6 (maybe earlier), `audio_exists()` does not correctly return true for ogg files, due to an internal bug with audio streams.
Instead, you should use `audioExtSoundExists()` and remove the ogg file with `audioExtOggRemoveStream()` from the database.

## Functions:

### `audioExtSoundExists(name)`

Checks whether a valid ogg or wav struct exists with that name.

### `audioExtSoundGet(name)`

Gets the sound struct from the list (or returns `undefined` if none exists).

### `audioExtSoundGetSoundID(name)`

Gets the soundID from the list (or returns `-1` if none exists).

### `audioExtOggAddStream(filename, [name])`

Adds the ogg file as a streamable source. The audio **must** remain availabe at all times while it's currently in use.

Optional Argument: `[name]` defaults to the name of the file (excluding the extension).

### `audioExtOggRemoveStream(name)`

Removes the ogg file, if one exists. Throws an error if it doesn't.

Optional Argument: `[name]` defaults to the name of the file (excluding the extension).

### `audioExtWavAddBuffer(buffer, name, [is3D], [filename])`

Adds the wav file as a sound source from a buffer. The buffer itself is copied. 

Optional Argument: `[name]` defaults to the name of the file (excluding the extension).

Optional Argument: `[is3D]` defaults to false. Determines if the audio file is intended for 3D Audio. Otherwise uses whatever the wav format determines. (Mono/Stereo)

Optional Argument: `[filename]` defaults to `""`. 

### `audioExtWavAddFile(filename, [name], [is3D])`

Adds the wav file as a sound source from a filename. As this audio is loaded and handled in memory, you do not need to keep the file around afterwards.

Optional Argument: `[name]` defaults to the name of the file (excluding the extension).

Optional Argument: `[is3D]` defaults to false. Determines if the audio file is intended for 3D Audio. Otherwise uses whatever the wav format determines. (Mono/Stereo)

### `audioExtWavRemove(name)`

Removes the wav file, if one exists. Throws an error if it doesn't.

## General Struct methods

`.getSoundID()` - Returns the SoundID from the struct.

`.getName()` - Returns the name from the struct.

`.getFileType()` - Returns the filetype (wav/ogg) from the struct.

`.getFileName()` - Returns the filename from the struct.

`.getType()` - Returns the channel type from the struct. 

## Wav struct specific methods

`.getBuffer()` - Returns the bufferID from the struct.
