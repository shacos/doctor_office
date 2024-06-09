import 'package:flutter_riverpod/flutter_riverpod.dart';

enum OnboardingSteps {
  first,
  second,
  third,
}

class OnboardingNotifier extends StateNotifier<OnboardingSteps> {
  OnboardingNotifier() : super(OnboardingSteps.first);

  void setNextStep() {
    const List<OnboardingSteps> values = OnboardingSteps.values;
    state = values[state.index + 1];
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingSteps>(
  (ref) => OnboardingNotifier(),
);
