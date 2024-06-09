import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:doctor_office/providers/onboarding.dart';
import 'package:doctor_office/screens/authentification.dart';
import 'package:doctor_office/screens/loading.dart';
import 'package:doctor_office/widgets/onboarding_dots.dart';
import 'package:doctor_office/widgets/onboarding_picture.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  OnboardingSteps onboardingStep = OnboardingSteps.first;

  String get onboardingTitle {
    switch (onboardingStep) {
      case OnboardingSteps.first:
        return 'Thousands of doctors';
      case OnboardingSteps.second:
        return 'Chat with doctors';
      case OnboardingSteps.third:
        return 'Live talk with doctor';
      default:
        return 'Thousands of doctors';
    }
  }

  void _nextOnboardingStep() {
    if (onboardingStep.index > 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const LoadingScreen(),
        ),
      );
      return;
    }

    ref.read(onboardingProvider.notifier).setNextStep();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    onboardingStep = ref.watch(onboardingProvider);

    return Scaffold(
      body: Column(
        children: [
          const OnboardingPicture(),
          SizedBox(height: screenHeight * 0.08),
          Text(
            onboardingTitle,
            style: textTheme.titleLarge!.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          SizedBox(
            width: screenWidth * 0.8,
            child: Text(
              'You can easily contact with a thousands of doctors and contacrt for your needs',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
          ),
          const OnboardingDots(),
          SizedBox(height: screenHeight * 0.05),
          OutlinedButton(
            onPressed: _nextOnboardingStep,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colorScheme.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 16, horizontal: screenWidth * 0.4),
            ),
            child: Text(
              'Skip',
              style: textTheme.bodyLarge!.copyWith(color: colorScheme.primary),
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const AuthentificationScreen(
                    isLogin: true,
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
        ],
      ),
    );
  }
}
