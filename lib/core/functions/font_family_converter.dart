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

FontFamily fontFamilyFromString(String value) {
  switch (value) {
    case 'FontFamily.anton':
      return FontFamily.anton;
    case 'FontFamily.dancing':
      return FontFamily.dancing;
    case 'FontFamily.edu':
      return FontFamily.edu;
    case 'FontFamily.roboto':
      return FontFamily.roboto;
    default:
      return FontFamily.roboto;
  }
}
