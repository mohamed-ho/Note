import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:notes/core/constants/font_family.dart';
import 'package:notes/core/functions/get_device_language.dart';
import 'package:notes/features/Home/presentation/widgets/text_family_style_example.dart';
import 'package:notes/generated/l10n.dart';

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
              position: getDeviceLanguage() == 'ar'
                  ? const RelativeRect.fromLTRB(0, 0, 100, 200)
                  : const RelativeRect.fromLTRB(100, 0, 0, 200),
              items: [
                PopupMenuItem(
                  child: Text(S.of(context).noteColor),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(S.of(context).selectColor),
                        content: MaterialColorPicker(
                            onColorChange: onNoteColorChange),
                        actions: [
                          ElevatedButton(
                            child: Text(S.of(context).gotIt),
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
                  child: Text(S.of(context).textColor),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(S.of(context).selectColor),
                        content: MaterialColorPicker(
                            onColorChange: onTextColorChange),
                        actions: [
                          ElevatedButton(
                            child: Text(S.of(context).gotIt),
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
                  child: Text(S.of(context).textFamily),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          S.of(context).selectTextFamily,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFamilyStyleExample(
                              onFontFamilyChange: onFontFamilyTap,
                              fontFamily: getDeviceLanguage() == 'ar'
                                  ? FontFamily.arabic1
                                  : FontFamily.anton,
                            ),
                            TextFamilyStyleExample(
                              onFontFamilyChange: onFontFamilyTap,
                              fontFamily: getDeviceLanguage() == 'ar'
                                  ? FontFamily.arabic2
                                  : FontFamily.dancing,
                            ),
                            TextFamilyStyleExample(
                              onFontFamilyChange: onFontFamilyTap,
                              fontFamily: getDeviceLanguage() == 'ar'
                                  ? FontFamily.arabic4
                                  : FontFamily.edu,
                            ),
                            TextFamilyStyleExample(
                              onFontFamilyChange: onFontFamilyTap,
                              fontFamily: getDeviceLanguage() == 'ar'
                                  ? FontFamily.arabic3
                                  : FontFamily.roboto,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                PopupMenuItem(
                  onTap: defaultSettings,
                  child: Text(S.of(context).defaultSettings),
                ),
              ]);
        },
        icon: const Icon(Icons.settings));
  }
}
