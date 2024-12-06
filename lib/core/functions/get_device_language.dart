import 'dart:ui';

String? getDeviceLanguage() {
  Locale locale = PlatformDispatcher.instance.locale;
  return locale.languageCode;
}
