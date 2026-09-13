import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const FutureFaceApp());
}

class FutureFaceApp extends StatelessWidget {
  const FutureFaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FUTURE FACE',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
