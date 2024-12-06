import 'package:flutter/material.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/presentation/widgets/note_item.dart';

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
