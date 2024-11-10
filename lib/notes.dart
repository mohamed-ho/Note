import 'package:flutter/material.dart';
import 'package:notes/features/Home/presentation/screens/home_screen.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark),
          home: const HomeScreen()),
    );
  }
}
