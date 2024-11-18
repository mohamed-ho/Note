import 'package:dartz/dartz.dart';
import 'package:notes/core/failure/Failure.dart';
import 'package:notes/features/Home/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, void>> deleteNote(int noteId);
  Future<Either<Failure, void>> addNote(Note note);
  Future<Either<Failure, void>> updateNote(Note note);
  Future<Either<Failure, Note>> getSearchNote(String noteTitle);
}
