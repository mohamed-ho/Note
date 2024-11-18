import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/domain/usecases/add_note_usercase.dart';
import 'package:notes/features/Home/domain/usecases/delete_note_usecase.dart';
import 'package:notes/features/Home/domain/usecases/get_notes_usercase.dart';
import 'package:notes/features/Home/domain/usecases/update_note_usecase.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final AddNoteUsercase addNoteUsercase;
  final UpdateNoteUsecase updateNoteUsecase;
  final DeleteNoteUsecase deleteNoteUsecase;
  final GetNotesUsercase getNotesUsercase;
  NoteCubit(
      {required this.addNoteUsercase,
      required this.deleteNoteUsecase,
      required this.getNotesUsercase,
      required this.updateNoteUsecase})
      : super(NoteInitial());

  Future addNote(Note note) async {
    emit(NoteLoadingState());
    final result = await addNoteUsercase(note);
    result.fold((l) => emit(NoteErrorSate(message: l.message)),
        (r) => emit(NoteCompleteProcessState()));
  }

  Future updateNote(Note note) async {
    emit(NoteLoadingState());
    final result = await updateNoteUsecase(note);
    result.fold((l) => emit(NoteErrorSate(message: l.message)),
        (r) => emit(NoteCompleteProcessState()));
  }

  Future deleteNote(int noteId) async {
    emit(NoteLoadingState());
    final result = await deleteNoteUsecase(noteId);
    result.fold((l) => emit(NoteErrorSate(message: l.message)),
        (r) => emit(NoteCompleteProcessState()));
  }

  Future getNotes() async {
    emit(NoteLoadingState());
    final result = await getNotesUsercase();
    result.fold((l) => emit(NoteErrorSate(message: l.message)),
        (r) => emit(NoteGetNotsState(notes: r)));
  }
}
