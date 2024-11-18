import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/config/routes/note_routes.dart';
import 'package:notes/core/functions/font_family_converter.dart';
import 'package:notes/features/Home/domain/entities/note.dart';

class NoteDetialsScreen extends StatelessWidget {
  const NoteDetialsScreen({super.key, required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, NoteRoutes.updateNoteScreen,
              arguments: note);
        },
        backgroundColor: note.textColor,
        child: Icon(
          Icons.edit,
          color: note.noteColor,
        ),
      ),
      body: Hero(
        tag: '${note.id}',
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: double.infinity,
            height: double.infinity,
            color: note.noteColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    note.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color: note.textColor,
                      fontFamily: fontFamilyConverter(note.fontFamily),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    note.content,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: note.textColor,
                      fontFamily: fontFamilyConverter(note.fontFamily),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
