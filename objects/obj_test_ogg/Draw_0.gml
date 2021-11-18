draw_rectangle(x-256,y-48,x+256,y+48, true);
draw_set_halign(fa_center);
draw_text(x, y, audio.getFileType() + " : " + audio.getfilePath());
draw_set_halign(fa_right);
draw_text(room_width - 8, 8, "Oggs Loaded:\n" + audioNames);