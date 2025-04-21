import 'package:flutter/material.dart';
import '../app_styles.dart';
import 'video_screen.dart';
import 'audio_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const HomeScreen({required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Головна', style: AppTextStyles.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onToggleTheme,
              child: Text('Змінити тему', style: AppTextStyles.buttonText),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => VideoScreen()),
                  ),
              child: Text('Відео', style: AppTextStyles.buttonText),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AudioScreen()),
                  ),
              child: Text('Аудіо', style: AppTextStyles.buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
