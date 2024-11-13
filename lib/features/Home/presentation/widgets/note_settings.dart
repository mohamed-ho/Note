import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/core/constants/font_family.dart';
import 'package:notes/core/functions/font_family_converter.dart';

class NoteSetting extends StatelessWidget {
  const NoteSetting(
      {super.key,
      required this.onNoteColorChange,
      required this.onTextColorChange,
      required this.defaultSettings,
      required this.onFontFamilyTap});
  final Function(Color) onNoteColorChange;
  final Function(Color) onTextColorChange;
  final Function(FontFamily) onFontFamilyTap;
  final Function() defaultSettings;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(100, 0, 0, 200),
              items: [
                PopupMenuItem(
                  child: const Text('Note Color'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Select you color '),
                        content: MaterialColorPicker(
                            onColorChange: onNoteColorChange),
                        actions: [
                          ElevatedButton(
                            child: const Text('Got it'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
                PopupMenuItem(
                  child: const Text('Text Color'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Select you color '),
                        content: MaterialColorPicker(
                            onColorChange: onTextColorChange),
                        actions: [
                          ElevatedButton(
                            child: const Text('Got it'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
                PopupMenuItem(
                  onTap: defaultSettings,
                  child: const Text('Default Settings'),
                ),
                PopupMenuItem(
                  child: const Text('Text Family'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Select your Text Family',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        content: Column(
                          children: [
                            TextFamilyStyleExample(
                              onFontFamilyChange: onFontFamilyTap,
                              fontFamily: FontFamily.anton,
                            ),
                            TextFamilyStyleExample(
                              onFontFamilyChange: onFontFamilyTap,
                              fontFamily: FontFamily.dancing,
                            ),
                            TextFamilyStyleExample(
                              onFontFamilyChange: onFontFamilyTap,
                              fontFamily: FontFamily.edu,
                            ),
                            TextFamilyStyleExample(
                              onFontFamilyChange: onFontFamilyTap,
                              fontFamily: FontFamily.roboto,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ]);
        },
        icon: const Icon(Icons.settings));
  }
}

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
          'please Choose your Font Family',
          style: TextStyle(
            fontSize: 14,
            fontFamily: fontFamilyConverter(fontFamily),
          ),
        ),
      ),
    );
  }
}
