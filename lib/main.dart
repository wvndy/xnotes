import 'package:flutter/material.dart';

import 'app/routes.dart';
import 'models/note_item.dart';
import 'screens/add_note_screen.dart';
import 'screens/detail_note_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_shell.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const XnotesApp());

class XnotesApp extends StatelessWidget {
  const XnotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xnotes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.home: (_) => const MainShell(),
        AppRoutes.addNote: (_) => const AddNoteScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.detailNote) {
          final note = settings.arguments as NoteItem?;
          return MaterialPageRoute(
            builder: (_) => DetailNoteScreen(note: note),
          );
        }
        return null;
      },
    );
  }
}
