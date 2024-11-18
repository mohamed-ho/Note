import 'package:get_it/get_it.dart';
import 'package:notes/features/Home/data/datasources/database_helper.dart';
import 'package:notes/features/Home/data/datasources/note_local_data_source.dart';
import 'package:notes/features/Home/data/repositories/note_repository_impl.dart';
import 'package:notes/features/Home/domain/repositories/note_repository.dart';
import 'package:notes/features/Home/domain/usecases/add_note_usercase.dart';
import 'package:notes/features/Home/domain/usecases/delete_note_usecase.dart';
import 'package:notes/features/Home/domain/usecases/get_notes_usercase.dart';
import 'package:notes/features/Home/domain/usecases/update_note_usecase.dart';
import 'package:notes/features/Home/presentation/cubit/cubit/note_cubit.dart';

final ls = GetIt.instance;

class HomeInjection {
  void init() {
    ls.registerFactory(() => NoteCubit(
        addNoteUsercase: ls(),
        deleteNoteUsecase: ls(),
        getNotesUsercase: ls(),
        updateNoteUsecase: ls()));
    ls.registerLazySingleton(() => AddNoteUsercase(noteRepository: ls()));
    ls.registerLazySingleton(() => DeleteNoteUsecase(noteRepository: ls()));
    ls.registerLazySingleton(() => GetNotesUsercase(noteRepository: ls()));
    ls.registerLazySingleton(() => UpdateNoteUsecase(noteRepository: ls()));

    ls.registerLazySingleton<NoteRepository>(
        () => NoteRepositoryImpl(noteLocalDataSource: ls()));

    ls.registerLazySingleton<NoteLocalDataSource>(
        () => NoteLocalDataSourceImpl(databaseHelper: ls()));

    ls.registerLazySingleton(() => DatabaseHelper.instance);
  }
}
