import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:doctor_office/providers/onboarding.dart';

class OnboardingPicture extends ConsumerStatefulWidget {
  const OnboardingPicture({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _OnboardingPictureState();
  }
}

class _OnboardingPictureState extends ConsumerState<OnboardingPicture> {
  OnboardingSteps onboardingStep = OnboardingSteps.first;

  Color get containerColor {
    switch (onboardingStep) {
      case OnboardingSteps.first:
        return const Color.fromARGB(255, 147, 184, 254);
      case OnboardingSteps.second:
        return const Color.fromARGB(255, 237, 161, 171);
      case OnboardingSteps.third:
        return const Color.fromARGB(255, 0, 218, 190);
      default:
        return const Color.fromARGB(255, 147, 184, 254);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    onboardingStep = ref.watch(onboardingProvider);

    return Container(
      height: screenHeight * 0.5,
      width: screenWidth,
      alignment: Alignment.bottomCenter,
      color: containerColor,
      child: Image.asset(
        'assets/images/onboarding_person_${onboardingStep.index}.png',
        height: screenHeight * 0.35,
        fit: BoxFit.contain,
      ),
    );
  }
}
