part of 'note_cubit.dart';

sealed class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

final class NoteInitial extends NoteState {}

final class NoteErrorSate extends NoteState {
  final String message;
  const NoteErrorSate({required this.message});
}

final class NoteLoadingState extends NoteState {}

final class NoteCompleteProcessState extends NoteState {}

final class NoteGetNotsState extends NoteState {
  final List<Note> notes;
  const NoteGetNotsState({required this.notes});
}
