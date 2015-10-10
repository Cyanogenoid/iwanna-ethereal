// applies replaygain with target volume 89 dB to normalise sound volumes

// sfx
audio_sound_gain(sndDeath, scrDbToAmplitude(-5.15), 0)
audio_sound_gain(sndSave, scrDbToAmplitude(-0.39), 0)
audio_sound_gain(sndShoot, scrDbToAmplitude(5.21), 0)
audio_sound_gain(sndJump, scrDbToAmplitude(9.46), 0)
audio_sound_gain(sndDJump, scrDbToAmplitude(9.46), 0)

// music
audio_sound_gain(musSynesthesia, scrDbToAmplitude(-9.97), 0)

