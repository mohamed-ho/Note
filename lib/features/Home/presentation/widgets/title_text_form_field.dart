import 'package:flutter/material.dart';
import 'package:notes/core/constants/font_family.dart';
import 'package:notes/core/functions/font_family_converter.dart';
import 'package:notes/features/Home/presentation/widgets/custom_input_decoration.dart';

class TitleTextFormField extends StatelessWidget {
  const TitleTextFormField(
      {super.key,
      required this.onChange,
      required this.title,
      required this.textColor,
      required this.fontFamily});
  final TextEditingController title;
  final Color textColor;
  final Function(String)? onChange;
  final FontFamily fontFamily;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
      validator: (value) {
        if (value == null) return 'content con not be empty';
        if (value.isEmpty) return 'content con not be empty';
        return null;
      },
      onChanged: onChange,
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: textColor,
          fontFamily: fontFamilyConverter(fontFamily)),
      decoration: CustomInputDecoration(
        hintText: 'title',
        hintStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: textColor,
            fontFamily: fontFamilyConverter(fontFamily)),
      ),
      controller: title,
    ));
  }
}
