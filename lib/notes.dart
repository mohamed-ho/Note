import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/config/routes/note_routes.dart';
import 'package:notes/core/functions/get_device_language.dart';
import 'package:notes/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});
  @override
  Widget build(BuildContext context) {
    print('${getDeviceLanguage()}----------------------');
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: SafeArea(
        child: MaterialApp(
          locale: Locale(getDeviceLanguage() == 'ar' ? 'ar' : 'en'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: NoteRoutes.route,
          initialRoute: NoteRoutes.homeScreen,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}
