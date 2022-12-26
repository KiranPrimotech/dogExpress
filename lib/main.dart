import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/app_themes/app_theme.dart';
import 'utils/localization/translation_string.dart';
import 'utils/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Music App",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
      fallbackLocale: const Locale('en', 'US'),
      locale: const Locale('en', 'US'),
      translations: TranslationString(),

    );
  }
}

