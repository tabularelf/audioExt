audioExtOggScan("sounds\\");
audio = audioExtSoundGet("ui_menu_popup_message_04");
audioName = audio.getName();
audioNames = string_replace(string(audioExtOggGetNames()), ",", ",\n");