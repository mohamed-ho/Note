import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/features/Home/presentation/widgets/custom_app_bar.dart';
import 'package:notes/features/Home/presentation/widgets/custom_floating_action_button.dart';
import 'package:notes/features/Home/presentation/widgets/note_item..dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomAppBar(),
            Expanded(child: NotesListView())
          ],
        ),
      ),
    );
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => NoteItem(),
    );
  }
}
