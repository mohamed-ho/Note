import 'package:dartz/dartz.dart';
import 'package:notes/core/failure/Failure.dart';
import 'package:notes/features/Home/data/datasources/note_local_data_source.dart';
import 'package:notes/features/Home/data/models/note_model.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;

  NoteRepositoryImpl({required this.noteLocalDataSource});
  @override
  Future<Either<Failure, void>> addNote(Note note) async {
    try {
      final result =
          await noteLocalDataSource.addNote(NoteModel.fromNote(note));
      return Right(result);
    } catch (e) {
      return Left(CachFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(int noteId) async {
    try {
      final result = await noteLocalDataSource.deleteNote(noteId);
      return Right(result);
    } catch (e) {
      return Left(CachFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getNotes() async {
    try {
      final result = await noteLocalDataSource.getNotes();
      return Right(result);
    } catch (e) {
      return Left(CachFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateNote(Note note) async {
    try {
      final result =
          await noteLocalDataSource.updateNote(NoteModel.fromNote(note));
      return Right(result);
    } catch (e) {
      return Left(CachFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Note>> getSearchNote(String noteTitle) async {
    try {
      final result = await noteLocalDataSource.getSearchNote(noteTitle);
      return Right(result);
    } catch (e) {
      return Left(CachFailure(message: e.toString()));
    }
  }
}
