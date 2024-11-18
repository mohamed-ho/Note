import 'package:flutter/material.dart';
import 'package:notes/features/Home/home_injection.dart';
import 'package:notes/notes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HomeInjection().init();
  runApp(const Notes());
}
