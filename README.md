# audioExt v0.0.3
 Sound External Loader/Unloader Manager for GameMaker Studio 2.3.1+
 
 This library helps load/unload, assign and manage ogg/wav files into neat lil structs to quickly utilize.

Note: ~~Only wavs currently support 3D audio. Ogg files are streamed in and do not have an option for 3D audio support support 3D audio out of the box~~ Both wav and ogg files support 3D Audio.
Additionally: As of 2.3.6 (maybe earlier), `audio_exists()` does not correctly return true for ogg files, due to an internal bug with audio streams.
Instead, you should use `audioExtSoundExists()` and remove the ogg file with `audioExtOggRemoveStream()` from the database.

Note: signed 16-bit and unsigned 8-bit are only supported for wav files.

## Supported Platforms:

| Windows | MacOSX | Linux | iOS | Android | HTML5 | Opera GX | Xbox One UWP |
| --- | --- | --- | --- | --- | --- | --- | --- |
|✔|✔|✔|✔|✔|❌|✔|✔|

## Functions: 

### `audioExtSoundExists(name)`

Checks whether a valid ogg or wav struct exists with that name.

Returns: true/false.

### `audioExtSoundGet(name)`

Gets the sound struct from the list.

Returns: struct or `undefined`.

### `audioExtSoundGetSoundID(name/audioStruct)`

Gets the soundID from the list. If unloaded, will load in the sound first before passing the soundID.

Returns: soundID.

### `audioExtSoundLoad(name/audioStruct, ...)`

Loads in the audioStruct. Multiple arguments can be provided for each sequential audio.

### `audioExtSoundUnload(name/audioStruct, [forced])`

Unloads the audio. 

Optional Argument: `[forced]` is default to false. On true, it will automatically unload the audio. Otherwise, it'll wait until the audio is done playing.

### `audioExtSoundUnloadAll([forced])`

Unloads all currently loaded audio. 

Optional Argument: `[forced]` is default to false. On true, it will automatically unload the audio. Otherwise, it'll wait until the audio is done playing.

### `audioExtSoundRemove(name/audioStruct, ...)` 

Removes the audioStruct from the database. Multiple arguments will remove multiple entries.

### `audioExtSoundIsLoaded(name/audioStruct)`

Returns whether the audio is loaded in or not.

### `audioExtSoundClear()`

Unloads all audio entries from memory. 

### `audioExtStep()`

A necessary function to include in the step event of your project.

### `audioExtOggAddStream(filename, [preload] [name])`

Adds the ogg file as a streamable source. The audio **must** remain availabe at all times while it's currently in use.

Optional Argument: `[preload]` defaults to true. Adds an entry but doesn't actually load in the file.

Optional Argument: `[name]` defaults to the name of the file (excluding the extension).

Returns: struct or `undefined`.

### `audioExtOggRemoveStream(name)`

Removes the ogg file, if one exists. Throws an error if it doesn't.

Optional Argument: `[name]` defaults to the name of the file (excluding the extension).

### `audioExtWavAddBuffer(buffer, name, [is3D], [filename])`

Adds the wav file as a sound source from a buffer. The buffer itself is copied. 

`name` is the name that you want audioExt to recongize it as.

Optional Argument: `[is3D]` defaults to false. Determines if the audio file is intended for 3D Audio. Otherwise uses whatever the wav format determines. (Mono/Stereo)

Optional Argument: `[preload]` defaults to false. Adds an entry but doesn't actually load in the file.

Optional Argument: `[compressedInMemory]` defaults to false. Compresses data in memory automatically. Note: If `[preload]` is set to true, it will copy the buffer, but quickly compresses down in memory. Making it "unloaded".

Optional Argument: `[filename]` defaults to `""`. 

Returns: struct or `undefined`.

### `audioExtWavAddFile(filename, [is3D], [compressedInMemory], [name])`

Adds the wav file as a sound source from a filename. As this audio is loaded and handled in memory, you do not need to keep the file around afterwards.

Optional Argument: `[is3D]` defaults to false. Determines if the audio file is intended for 3D Audio. Otherwise uses whatever the wav format determines. (Mono/Stereo)

Optional Argument: `[preload]` defaults to false. Adds an entry but doesn't actually load in the file.

Optional Argument: `[compressedInMemory]` defaults to false. Compresses data in memory automatically. Note: If `[preload]` is set to true, it will load in the file, but quickly compresses down in memory. Making it "unloaded".

Optional Argument: `[name]` defaults to the name of the file (excluding the extension).

Returns: struct or `undefined`.

### `audioExtWavRemove(name)`

Removes the wav file, if one exists. Throws an error if it doesn't.

### `audioExtOggGetNames(name)`

Gets the name of all of the ogg files loaded in.

Returns: array

### `audioExtWavGetNames(name)`

Gets the name of all of the wav files loaded in.

Returns: array

### `audioExtOggScan(filePath, [preload])`

Scans all of the files within the chosen filePath and loads in any ogg files.

Optional Argument: `[preload]` defaults to false. Adds an entry but doesn't actually load in the file.

### `audioExtWavScan(filePath, [preload], [compressedInMemory])`

Scans all of the files within the chosen filePath and loads in any wav files.

Optional Argument: `[preload]` defaults to false. Adds an entry but doesn't actually load in the file.

Optional Argument: `[compressedInMemory]` defaults to false. Compresses data in memory automatically. Note: If `[preload]` is set to true, it will copy the buffer, but quickly compresses down in memory. Making it "unloaded".

## General Struct methods

`.getSoundID()` - Returns the SoundID from the struct. If unloaded, will load in the sound first before passing the soundID.

`.getName()` - Returns the name from the struct.

`.getFileType()` - Returns the filetype (wav/ogg) from the struct.

`.getFileName()` - Returns the filename from the struct.

`.getChannel()` - Returns the channel type from the struct. 

`.load()` - Loads in the audio.

`.unload([forced])` - Unloads the audio. If forced is set to true, it will automatically unload the audio. Otherwise, it'll wait until the audio is done playing.

## Wav struct specific methods

`.getBuffer()` - Returns the bufferID from the struct.
