/// @description Insert description here
// You can write your code in this editor

audio_stop_all();//先停止所有音乐，这是一个好习惯，然后再进行处理
global.background_sound = audio_emitter_create();//创建一个音频频道
audio_play_sound_on(global.background_sound, snd_Super_Mario_Bros, true, 10);
//在指定的频道上播放背景音乐
