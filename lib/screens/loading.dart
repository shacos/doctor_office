import 'package:flutter/material.dart';

import 'package:doctor_office/screens/welcome.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  void _navigateToMainScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const WelcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: Image.asset(
          'assets/images/loading_logo.png',
          width: screenWidth * 0.45,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
