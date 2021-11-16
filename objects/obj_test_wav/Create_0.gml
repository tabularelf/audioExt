//audioExtWavScan("sounds\\");
audio = audioExtWavAddFile("sounds\\ui_menu_popup_message_02.wav");//audioExtSoundGet("ui_menu_popup_message_02");
audioName = audio.getName();
audioNames = string_replace(string(audioExtWavGetNames()), ",", ",\n");