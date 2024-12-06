import 'package:flutter/material.dart';
import 'package:notes/core/constants/font_family.dart';
import 'package:notes/core/functions/font_family_converter.dart';
import 'package:notes/features/Home/presentation/widgets/custom_input_decoration.dart';
import 'package:notes/generated/l10n.dart';

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
      maxLength: 30,
      onChanged: onChange,
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: textColor,
          fontFamily: fontFamilyConverter(fontFamily)),
      decoration: customInputDecoration(
        hintText: S.of(context).title,
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
