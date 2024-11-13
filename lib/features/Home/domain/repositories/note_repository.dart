import 'package:dartz/dartz.dart';
import 'package:notes/core/Failure/Failure.dart';
import 'package:notes/features/Home/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, void>> deleteNote(String noteId);
  Future<Either<Failure, void>> addNote(Note note);
  Future<Either<Failure, void>> updateNote(Note note);
}
