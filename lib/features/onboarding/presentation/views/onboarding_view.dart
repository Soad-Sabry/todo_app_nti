import 'package:flutter/material.dart';
import 'package:todo/features/onboarding/presentation/views/widgets/onboading_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBody(),

    );
  }
}
