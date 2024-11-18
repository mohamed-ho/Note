import 'package:dartz/dartz.dart';
import 'package:notes/core/failure/Failure.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/domain/repositories/note_repository.dart';

class GetNotesUsercase {
  final NoteRepository noteRepository;
  GetNotesUsercase({required this.noteRepository});

  Future<Either<Failure, Note>> call(String noteTitle) async {
    return await noteRepository.getSearchNote(noteTitle);
  }
}
