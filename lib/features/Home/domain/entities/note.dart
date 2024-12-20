import 'package:flutter/material.dart';
import 'package:notes/core/constants/font_family.dart';

class Note {
  final String title;
  final String content;
  final String date;
  final FontFamily fontFamily;
  final Color noteColor;
  final Color textColor;
  final int id;

  Note(
      {required this.title,
      required this.content,
      required this.date,
      required this.fontFamily,
      required this.noteColor,
      required this.textColor,
      required this.id});
}
