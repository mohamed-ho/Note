import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:notes/config/routes/note_routes.dart';
import 'package:notes/core/constants/font_family.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/presentation/cubit/cubit/note_cubit.dart';
import 'package:notes/features/Home/presentation/widgets/content_text_form_field.dart';
import 'package:notes/features/Home/presentation/widgets/note_settings.dart';
import 'package:notes/features/Home/presentation/widgets/title_text_form_field.dart';
import 'package:notes/generated/l10n.dart';

class UpdateNoteScreen extends StatefulWidget {
  const UpdateNoteScreen({super.key, required this.note});
  final Note note;
  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  late Color noteColor;
  late Color textColor;
  late FontFamily fontFamily;
  bool isLoading = false;
  @override
  void initState() {
    noteColor = widget.note.noteColor;
    textColor = widget.note.textColor;
    fontFamily = widget.note.fontFamily;
    title.text = widget.note.title;
    content.text = widget.note.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: noteColor,
      body: BlocListener<NoteCubit, NoteState>(
        listener: (context, state) {
          if (state is NoteLoadingState) {
            setState(() {
              isLoading = true;
            });
          } else if (state is NoteCompleteProcessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, NoteRoutes.homeScreen, (route) => true);
          } else if (state is NoteErrorSate) {
            setState(() {
              isLoading = false;
            });
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(S.of(context).errorProcess),
                      content: Text(state.message),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(S.of(context).ok))
                      ],
                    ));
          }
        },
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Visibility(
                        visible:
                            title.text.isNotEmpty && content.text.isNotEmpty,
                        child: IconButton(
                          onPressed: () {
                            context.read<NoteCubit>().updateNote(Note(
                                title: title.text,
                                content: content.text,
                                fontFamily: fontFamily,
                                noteColor: noteColor,
                                textColor: textColor,
                                date: DateFormat('EEE,M/d/y')
                                    .format(DateTime.now()),
                                id: widget.note.id));
                          },
                          icon: Icon(
                            Icons.check,
                            size: 30.w,
                          ),
                        ),
                      ),
                      TitleTextFormField(
                          fontFamily: fontFamily,
                          textColor: textColor,
                          onChange: (value) {
                            setState(() {
                              title.text = value;
                            });
                          },
                          title: title),
                      NoteSetting(
                        onNoteColorChange: (value) {
                          setState(() {
                            noteColor = value;
                          });
                        },
                        onTextColorChange: (value) {
                          setState(() {
                            textColor = value;
                          });
                        },
                        defaultSettings: () {
                          setState(() {
                            noteColor = Colors.transparent;
                            textColor = Colors.white;
                            fontFamily = FontFamily.roboto;
                          });
                        },
                        onFontFamilyTap: (value) {
                          setState(() {
                            fontFamily = value;
                          });
                        },
                      ),
                    ],
                  ),
                  ContentTextFormField(
                    textColor: textColor,
                    content: content,
                    fontFamily: fontFamily,
                    onChanged: (value) {
                      setState(() {
                        content.text = value;
                      });
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
