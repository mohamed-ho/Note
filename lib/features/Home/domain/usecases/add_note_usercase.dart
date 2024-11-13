import 'package:dartz/dartz.dart';
import 'package:notes/core/Failure/Failure.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/domain/repositories/note_repository.dart';

class AddNoteUsercase {
  final NoteRepository noteRepository;
  AddNoteUsercase({required this.noteRepository});

  Future<Either<Failure, void>> call(Note note) async {
    return await noteRepository.addNote(note);
  }
}
