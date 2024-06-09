import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

import 'package:doctor_office/screens/onboarding.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  primary: const Color.fromARGB(255, 41, 114, 254),
  seedColor: const Color.fromARGB(255, 41, 114, 254),
  surface: Colors.white,
  error: Colors.red[800]!,
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.surface,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.sourceSans3TextTheme(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then(
    (_) {
      runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Office Management System',
      theme: theme,
      home: const OnboardingScreen(),
    );
  }
}
