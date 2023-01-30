import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../Resources/color_manager.dart';
import '../../../../Resources/style_manager.dart';

class TotalRatings extends StatelessWidget {
  String ratings;
  TotalRatings({
    required this.ratings,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Text(
        ratings,
        style: getregulartextStyle(
            color: Colors.black.withOpacity(0.8), fontSize: 10),
      ),
    );
  }
}

class ProgresWidget extends StatelessWidget {
  Color selectedColor;
  int currentStep;
  ProgresWidget({required this.selectedColor, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: 70,
      currentStep: currentStep,
      size: 8,
      padding: 0,
      selectedColor: selectedColor,
      unselectedColor: ColorManager.grey,
      roundedEdges: Radius.circular(10),
    );
  }
}

class RatingTitles extends StatelessWidget {
  String title;
  RatingTitles({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Text(
        title,
        style: getregulartextStyle(
            color: Colors.black.withOpacity(0.8), fontSize: 10),
      ),
    );
  }
}

