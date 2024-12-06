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
    case FontFamily.arabic1:
      return 'arabic1';
    case FontFamily.arabic2:
      return 'arabic2';
    case FontFamily.arabic3:
      return 'arabic3';
    case FontFamily.arabic4:
      return 'arabic4';
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
    case 'FontFamily.arabic1':
      return FontFamily.arabic1;
    case 'FontFamily.arabic2':
      return FontFamily.arabic2;
    case 'FontFamily.arabic3':
      return FontFamily.arabic3;
    case 'FontFamily.arabic4':
      return FontFamily.arabic4;
    default:
      return FontFamily.roboto;
  }
}
