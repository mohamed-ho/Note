import 'package:notes/core/failure/failure.dart';
import 'package:notes/features/Home/data/datasources/database_helper.dart';
import 'package:notes/features/Home/data/models/note_model.dart';

abstract class NoteLocalDataSource {
  Future<List<NoteModel>> getNotes();
  Future<void> addNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
  Future<void> deleteNote(int noteId);
  Future<NoteModel> getSearchNote(String noteTitle);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final DatabaseHelper databaseHelper;

  NoteLocalDataSourceImpl({required this.databaseHelper});
  @override
  Future<void> addNote(NoteModel note) async {
    try {
      final db = await databaseHelper.database;
      int result = await db.insert('notes', note.toMap());
      if (result == 0) {
        throw CachFailure(message: 'there are Error please try again...');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNote(int noteId) async {
    try {
      final db = await databaseHelper.database;
      final result = await db.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [noteId],
      );
      if (result == 0) {
        throw CachFailure(message: 'there are Error please try again...');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    try {
      final db = await databaseHelper.database;
      final result = await db.query('notes');
      return result.map((map) => NoteModel.fromMap(map)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    try {
      final db = await databaseHelper.database;
      final result = await db.update(
        'notes',
        note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
      );
      if (result == 0) {
        throw CachFailure(message: 'there are Error please try again...');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NoteModel> getSearchNote(String noteTitle) async {
    try {
      final db = await databaseHelper.database;
      final result = await db.query(
        'notes',
        where: 'noteTitle = ?',
        whereArgs: [noteTitle],
      );
      if (result.isNotEmpty) {
        return NoteModel.fromMap(result[0]);
      } else {
        throw CachFailure(message: 'there are no note like this');
      }
    } catch (e) {
      rethrow;
    }
  }
}
