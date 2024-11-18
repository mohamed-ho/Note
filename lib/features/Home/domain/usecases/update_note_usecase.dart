import 'package:dartz/dartz.dart';
import 'package:notes/core/failure/Failure.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/domain/repositories/note_repository.dart';

class UpdateNoteUsecase {
  final NoteRepository noteRepository;
  UpdateNoteUsecase({required this.noteRepository});

  Future<Either<Failure, void>> call(Note note) async {
    return await noteRepository.updateNote(note);
  }
}
