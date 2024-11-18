import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/presentation/cubit/cubit/note_cubit.dart';
import 'package:notes/features/Home/presentation/widgets/custom_app_bar.dart';
import 'package:notes/features/Home/presentation/widgets/custom_floating_action_button.dart';
import 'package:notes/features/Home/presentation/widgets/empty_notes.dart';
import 'package:notes/features/Home/presentation/widgets/note_item.dart';

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
            title: const Text('Error Process'),
            content: Text(state.message),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
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

class NotesListView extends StatefulWidget {
  const NotesListView({super.key, required this.notes});
  final List<Note> notes;

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _controller.forward();

    _slideAnimations = List.generate(
      widget.notes.length, // Adjust based on the number of items in the list
      (index) => Tween<Offset>(
        begin: const Offset(0, 1), // Start off-screen at the bottom
        end: const Offset(0, 0), // End in-place
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1, // Delay each item slightly
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.notes.length,
      itemBuilder: (context, index) => SlideTransition(
        position: _slideAnimations[index],
        child: NoteItem(
          note: widget.notes[index],
        ),
      ),
    );
  }
}
