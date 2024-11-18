import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/config/routes/note_routes.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.tealAccent.shade700,
      onPressed: () {
        Navigator.pushNamed(context, NoteRoutes.addNoteScreen);
      },
      child: Icon(
        Icons.add,
        size: 30.w,
      ),
    );
  }
}
