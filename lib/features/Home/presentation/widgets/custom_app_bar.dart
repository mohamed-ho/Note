import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/presentation/widgets/search_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.notes});
  final List<Note> notes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
        children: [
          const Text(
            'Notes',
            style: TextStyle(fontSize: 28),
          ),
          const Spacer(),
          SearchIconButton(notes: notes)
        ],
      ),
    );
  }
}
