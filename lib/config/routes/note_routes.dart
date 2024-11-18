import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/Home/domain/entities/note.dart';
import 'package:notes/features/Home/home_injection.dart';
import 'package:notes/features/Home/presentation/cubit/cubit/note_cubit.dart';
import 'package:notes/features/Home/presentation/screens/add_note_screen.dart';
import 'package:notes/features/Home/presentation/screens/home_screen.dart';
import 'package:notes/features/Home/presentation/screens/note_detials_screen.dart';
import 'package:notes/features/Home/presentation/screens/update_note_screen.dart';

class NoteRoutes {
  static const String homeScreen = 'homeScreen';
  static const String addNoteScreen = 'addNoteScreen';
  static const String noteDetailsScreen = 'noteDetailsScreen';
  static const String updateNoteScreen = 'updateNoteScreen';

  static Route<dynamic>? route(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<NoteCubit>()..getNotes(),
                  child: const HomeScreen(),
                ));
      case addNoteScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<NoteCubit>(),
                  child: const AddNoteScreen(),
                ));
      case noteDetailsScreen:
        Note note = routeSettings.arguments as Note;
        return MaterialPageRoute(
            builder: (context) => NoteDetialsScreen(note: note));
      case updateNoteScreen:
        Note note = routeSettings.arguments as Note;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<NoteCubit>(),
                  child: UpdateNoteScreen(note: note),
                ));
      default:
        return MaterialPageRoute(builder: (context) => const DefaultNORoute());
    }
  }
}

class DefaultNORoute extends StatelessWidget {
  const DefaultNORoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('there is not a route like this'),
    );
  }
}
