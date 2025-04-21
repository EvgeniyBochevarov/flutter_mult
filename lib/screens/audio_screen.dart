import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../app_styles.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer _player;
  double _volume = 1.0;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    await _player.setLoopMode(LoopMode.one);
    await _player.setUrl(
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    );
    await _player.play();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _setVolume(double value) {
    setState(() {
      _volume = value;
      _player.setVolume(_volume);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Аудіо', style: AppTextStyles.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Гучність', style: AppTextStyles.body),
            Slider(value: _volume, onChanged: _setVolume, min: 0, max: 1),
            SizedBox(height: 20),
            StreamBuilder<PlayerState>(
              stream: _player.playerStateStream,
              builder: (context, snapshot) {
                final playing = snapshot.data?.playing ?? false;
                return IconButton(
                  iconSize: 48,
                  icon: Icon(playing ? Icons.pause_circle : Icons.play_circle),
                  onPressed: () => playing ? _player.pause() : _player.play(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
