import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips/screens/home_screen.dart';
import 'package:trips/theme/app_theme.dart';
import 'package:trips/providers/app_provider.dart';
import 'package:trips/utils/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        LanguageManager.currentLanguage = appProvider.language;

        return MaterialApp(
          title: 'Ninja Trips',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appProvider.themeMode,
          home: const HomeScreen(),
        );
      },
    );
  }
}