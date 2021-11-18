audioExtWavScan("sounds\\", true, true);
audio = audioExtSoundGet("ui_menu_popup_message_02");
audioName = audio.getName();
audioNames = string_replace(string(audioExtWavGetNames()), ",", ",\n");