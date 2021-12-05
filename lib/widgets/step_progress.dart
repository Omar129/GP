import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepProgress extends StatelessWidget {
  final int currentStep;
  const StepProgress({
    Key? key,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: 3,
      currentStep: currentStep,
      size: 12,
      padding: 8,
      roundedEdges: const Radius.circular(10),
      selectedColor: Theme.of(context).primaryColor,
      unselectedColor: Theme.of(context).primaryColorLight,
    );
  }
}
