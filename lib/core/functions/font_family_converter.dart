import 'package:notes/core/constants/font_family.dart';

String fontFamilyConverter(FontFamily fontFamily) {
  switch (fontFamily) {
    case FontFamily.anton:
      return 'Anton';
    case FontFamily.dancing:
      return 'Dancing';
    case FontFamily.edu:
      return 'Edu';
    case FontFamily.roboto:
      return 'Roboto';
    default:
      return 'Roboto';
  }
}
