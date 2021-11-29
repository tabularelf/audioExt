draw_rectangle(x-256,y-48,x+256,y+48, true);
draw_set_halign(fa_center);
draw_text(x, y, audio.getFileType() + " : " + audio.getFilePath());
draw_set_halign(fa_left);
draw_text(8, 8, "Wavs Loaded:\n" + audioNames);