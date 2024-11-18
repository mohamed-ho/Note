import 'package:dartz/dartz.dart';
import 'package:notes/core/failure/Failure.dart';
import 'package:notes/features/Home/domain/repositories/note_repository.dart';

class DeleteNoteUsecase {
  final NoteRepository noteRepository;
  DeleteNoteUsecase({required this.noteRepository});

  Future<Either<Failure, void>> call(int noteId) async {
    return await noteRepository.deleteNote(noteId);
  }
}
