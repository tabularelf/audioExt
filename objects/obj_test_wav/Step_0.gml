if (point_in_rectangle(mouse_x, mouse_y, x-256,y-48,x+256,y+48)) {
	if (mouse_check_button_released(mb_left)) {
		audio_play_sound(audioExtSoundGetSoundID(audioName), 1, false);	
	}	
}