#macro AUDIO_EXT_DEBUG_MODE											true		// Enables additional debug outputting.

#macro AUDIO_EXT_DIR_TO_SCAN_ON_START						"sounds\\"	// Default directory to look in.
#macro AUDIO_EXT_SCAN_ON_START									false		// Autoscans and adds ogg/wavs upon initalization.
#macro AUDIO_EXT_PRELOAD_ON_START								false        // Adds the entries but doesn't load them into memory until .getSoundID() or audioExtGetSoundID() is called.
#macro AUDIO_EXT_COMPRESS_ON_START							false       // Loads wav files in, but compresses them. Making them "unloaded".