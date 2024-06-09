import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/onboarding.dart';

class OnboardingDots extends ConsumerStatefulWidget {
  const OnboardingDots({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _OnboardingDotsState();
  }
}

class _OnboardingDotsState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final onboardingStep = ref.watch(onboardingProvider);

    return SizedBox(
      height: screenHeight * 0.05,
      width: screenWidth * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [0, 1, 2]
            .map(
              (index) => Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: onboardingStep.index == index
                      ? colorScheme.primary
                      : const Color.fromARGB(255, 217, 217, 217),
                  shape: BoxShape.circle,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
