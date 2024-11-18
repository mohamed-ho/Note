import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/config/routes/note_routes.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: SafeArea(
        child: MaterialApp(
          onGenerateRoute: NoteRoutes.route,
          initialRoute: NoteRoutes.homeScreen,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}
