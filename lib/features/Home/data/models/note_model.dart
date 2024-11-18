import 'package:notes/core/functions/color_hundler.dart';
import 'package:notes/core/functions/font_family_converter.dart';
import 'package:notes/features/Home/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel(
      {required super.title,
      required super.content,
      required super.fontFamily,
      required super.noteColor,
      required super.textColor,
      required super.date,
      required super.id});

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: map['date'],
      fontFamily: fontFamilyFromString(map['fontFamily']),
      textColor: ColorHundler.getColorFromHex(map['fontColor']),
      noteColor: ColorHundler.getColorFromHex(map['noteColor']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'fontFamily': fontFamily.toString(),
      'fontColor': ColorHundler.getHexFromColor(textColor),
      'noteColor': ColorHundler.getHexFromColor(noteColor),
      'date': date
    };
  }

  factory NoteModel.fromNote(Note note) {
    return NoteModel(
        title: note.title,
        content: note.content,
        fontFamily: note.fontFamily,
        noteColor: note.noteColor,
        textColor: note.textColor,
        id: note.id,
        date: note.date);
  }
}
