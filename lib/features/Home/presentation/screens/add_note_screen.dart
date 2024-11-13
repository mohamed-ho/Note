import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/core/constants/font_family.dart';
import 'package:notes/features/Home/presentation/widgets/content_text_form_field.dart';
import 'package:notes/features/Home/presentation/widgets/note_settings.dart';
import 'package:notes/features/Home/presentation/widgets/title_text_form_field.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  Color noteColor = Colors.transparent;
  Color textColor = Colors.white;
  FontFamily fontFamily = FontFamily.roboto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: noteColor,
      body: Column(
        children: [
          Row(
            children: [
              Visibility(
                visible: title.text.isNotEmpty && content.text.isNotEmpty,
                child: IconButton(
                  onPressed: () {},
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
                  });
                },
                onFontFamilyTap: (value) {
                  setState(() {
                    print('this is value ===============');
                    print(value);
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
    );
  }
}
