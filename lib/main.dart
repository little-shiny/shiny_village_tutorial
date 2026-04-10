import 'package:flutter/material.dart';
import 'tutorial_page.dart';

void main() {
  runApp(const ShinyVillageTutorialApp());
}

// App raíz sin estado
class ShinyVillageTutorialApp extends StatelessWidget {
  const ShinyVillageTutorialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ShinyVillage Tutorial',
      debugShowCheckedModeBanner: false,
      home: TutorialPage(),
    );
  }
}