import 'package:flutter/material.dart';
import 'package:flutter_mult/app_styles.dart';
import 'package:flutter_mult/screens/audio_screen.dart' as audio;
import 'package:flutter_mult/screens/video_screen.dart' as video;

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const HomeScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Головна', style: AppTextStyles.title),
        actions: [
          IconButton(icon: Icon(Icons.brightness_6), onPressed: onToggleTheme),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Мультимедійний додаток', style: AppTextStyles.title),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const audio.AudioScreen(),
                    ),
                  ),
              child: Text('Перейти до аудіо', style: AppTextStyles.buttonText),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const video.VideoScreen(),
                    ),
                  ),
              child: Text('Перейти до відео', style: AppTextStyles.buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
