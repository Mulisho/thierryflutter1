import 'package:flutter/material.dart';
import 'pages/connexion.dart'; 

void main() {
  runApp(const CvApp());
}

class CvApp extends StatelessWidget {
  const CvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV - Thierry M\'Lisho',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D2B4E),
          primary: const Color(0xFF0D2B4E),
        ),
        useMaterial3: true,
      ),
      home: const ConnexionPage(),
    );
  }
}