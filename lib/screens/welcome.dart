import 'package:flutter/material.dart';

import 'package:doctor_office/screens/authentification.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.5,
            width: screenWidth,
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/main_logo.png',
              width: screenWidth * 0.45,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: screenHeight * 0.3),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const AuthentificationScreen(
                    isLogin: false,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 16, horizontal: screenWidth * 0.4),
              backgroundColor: colorScheme.primary,
            ),
            child: Text(
              'Sign up',
              style: textTheme.bodyLarge!.copyWith(color: colorScheme.surface),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const AuthentificationScreen(
                    isLogin: true,
                  ),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colorScheme.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 16, horizontal: screenWidth * 0.4),
            ),
            child: Text(
              'Sign in',
              style: textTheme.bodyLarge!.copyWith(color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
