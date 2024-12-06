import 'package:flutter/material.dart';
import 'package:notes/core/constants/font_family.dart';
import 'package:notes/core/functions/font_family_converter.dart';
import 'package:notes/features/Home/presentation/widgets/custom_input_decoration.dart';
import 'package:notes/generated/l10n.dart';

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
      decoration: customInputDecoration(
        hintText: S.of(context).content,
        hintStyle: TextStyle(
            fontSize: 16,
            color: textColor,
            fontFamily: fontFamilyConverter(fontFamily)),
      ),
      maxLines: 10000,
    ));
  }
}
