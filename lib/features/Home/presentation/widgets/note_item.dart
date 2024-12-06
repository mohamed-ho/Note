import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/config/routes/note_routes.dart';
import 'package:notes/core/functions/font_family_converter.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/presentation/cubit/cubit/note_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NoteRoutes.noteDetailsScreen,
            arguments: note);
      },
      child: Hero(
        tag: '${note.id}',
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            height: .2.sh,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                color: note.noteColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    note.title,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: fontFamilyConverter(note.fontFamily),
                        fontSize: 22.sp,
                        color: note.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    note.content,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.clip,
                        color: note.textColor,
                        fontFamily: fontFamilyConverter(note.fontFamily),
                        fontSize: 16.sp),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        BlocProvider.of<NoteCubit>(context).deleteNote(note.id);
                      },
                      icon: Icon(
                        color: note.textColor,
                        Icons.delete,
                        size: 30.w,
                      )),
                ),
                Text(
                  note.date,
                  style: TextStyle(
                    color: note.textColor,
                    fontFamily: fontFamilyConverter(note.fontFamily),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String overFlowTextHandler(String noteContent, int maxLength) {
  return noteContent.length > maxLength
      ? '${noteContent.substring(0, maxLength)} ...'
      : noteContent;
}
