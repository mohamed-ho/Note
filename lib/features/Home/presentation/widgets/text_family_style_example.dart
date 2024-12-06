import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/core/constants/font_family.dart';
import 'package:notes/core/functions/font_family_converter.dart';
import 'package:notes/generated/l10n.dart';

class TextFamilyStyleExample extends StatelessWidget {
  const TextFamilyStyleExample(
      {super.key, required this.fontFamily, required this.onFontFamilyChange});
  final FontFamily fontFamily;
  final ValueChanged<FontFamily> onFontFamilyChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: () {
          onFontFamilyChange.call(fontFamily);
          Navigator.pop(context);
        },
        child: Text(
          S.of(context).selectTextFamily,
          style: TextStyle(
            fontSize: 14,
            fontFamily: fontFamilyConverter(fontFamily),
          ),
        ),
      ),
    );
  }
}
