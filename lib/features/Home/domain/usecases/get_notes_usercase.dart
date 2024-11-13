import 'package:dartz/dartz.dart';
import 'package:notes/core/Failure/Failure.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/domain/repositories/note_repository.dart';

class GetNotesUsercase {
  final NoteRepository noteRepository;
  GetNotesUsercase({required this.noteRepository});

  Future<Either<Failure, List<Note>>> call() async {
    return await noteRepository.getNotes();
  }
}
