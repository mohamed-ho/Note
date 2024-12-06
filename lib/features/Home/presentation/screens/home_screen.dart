import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/presentation/cubit/cubit/note_cubit.dart';
import 'package:notes/features/Home/presentation/widgets/custom_app_bar.dart';
import 'package:notes/features/Home/presentation/widgets/custom_floating_action_button.dart';
import 'package:notes/features/Home/presentation/widgets/empty_notes.dart';
import 'package:notes/features/Home/presentation/widgets/note_list_view.dart';
import 'package:notes/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if (state is NoteLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NoteErrorSate) {
          return AlertDialog(
            title: Text(S.of(context).errorProcess),
            content: Text(state.message),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).ok))
            ],
          );
        } else if (state is NoteGetNotsState) {
          return Scaffold(
            floatingActionButton: const CustomFloatingActionButton(),
            body: state.notes.isEmpty
                ? const EmptyNotes()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomAppBar(notes: state.notes),
                        Expanded(
                            child: NotesListView(
                          notes: state.notes,
                        ))
                      ],
                    ),
                  ),
          );
        } else {
          context.read<NoteCubit>().getNotes();
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

List<String> getNotesTitle(List<Note> notes) {
  return List<String>.from(notes.map((e) {
    return e.title;
  }));
}
