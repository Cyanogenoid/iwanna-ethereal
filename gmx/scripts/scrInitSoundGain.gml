// applies replaygain with target volume 89 dB to normalise sound volumes

gains[0, 0] = sndDeath;       gains[0, 1] =  0.15;
gains[1, 0] = sndSave;        gains[1, 1] = -0.39;
gains[2, 0] = sndShoot;       gains[2, 1] =  5.12;
gains[3, 0] = sndJump;        gains[3, 1] =  9.46;
gains[4, 0] = sndDJump;       gains[4, 1] =  9.46;
gains[5, 0] = musSynesthesia; gains[5, 1] = -9.97;

min_gain = scrDbToAmplitude(-10)
max_gain = scrDbToAmplitude(10)

for (i = 0; i < 6; i++) {
    gain = scrDbToAmplitude(gains[i, 1])
    // shift gain to fit range [min_gain, max_gain]
    gain = (gain - min_gain) / (max_gain - min_gain) * (1 - min_gain) + min_gain
    audio_sound_gain(gains[i, 0], gain, 0)
}

