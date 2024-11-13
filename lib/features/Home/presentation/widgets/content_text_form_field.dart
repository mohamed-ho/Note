import 'package:flutter/material.dart';
import 'package:notes/core/constants/font_family.dart';
import 'package:notes/core/functions/font_family_converter.dart';
import 'package:notes/features/Home/presentation/widgets/custom_input_decoration.dart';

class ContentTextFormField extends StatelessWidget {
  const ContentTextFormField(
      {super.key,
      required this.content,
      required this.onChanged,
      required this.textColor,
      required this.fontFamily});
  final Function(String)? onChanged;
  final TextEditingController content;
  final Color textColor;
  final FontFamily fontFamily;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
      onChanged: onChanged,
      style: TextStyle(
          fontSize: 16,
          color: textColor,
          fontFamily: fontFamilyConverter(fontFamily)),
      controller: content,
      validator: (value) {
        if (value == null) return 'content con not be empty';
        if (value.isEmpty) return 'content con not be empty';
        return null;
      },
      decoration: CustomInputDecoration(
        hintText: 'content',
        hintStyle: TextStyle(
            fontSize: 16,
            color: textColor,
            fontFamily: fontFamilyConverter(fontFamily)),
      ),
      maxLines: 10000,
    ));
  }
}
