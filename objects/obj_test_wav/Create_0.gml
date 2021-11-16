/// @description Insert description here
// You can write your code in this editor

audio = audioExtWavAddFile("sounds\\dog_bark_small_04.wav");
audioName = audio.getName();
audio_play_sound(audioExtSoundGetSoundID(audioName), 1, true);