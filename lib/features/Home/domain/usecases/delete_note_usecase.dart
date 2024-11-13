import 'package:dartz/dartz.dart';
import 'package:notes/core/Failure/Failure.dart';
import 'package:notes/features/Home/domain/repositories/note_repository.dart';

class DeleteNoteUsecase {
  final NoteRepository noteRepository;
  DeleteNoteUsecase({required this.noteRepository});

  Future<Either<Failure, void>> call(String noteId) async {
    return await noteRepository.deleteNote(noteId);
  }
}
