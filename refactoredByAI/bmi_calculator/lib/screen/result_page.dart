import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

/// Displays BMI calculation results in a dedicated screen
/// Takes BMI value, result classification and interpretation text as required parameters
class ResultPage extends StatelessWidget {
  // Constructor with required named parameters
  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretationText,
  });

  // Final fields to store BMI calculation results
  final String? bmiResult;
  final String? resultText;
  final String? interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppName),
        centerTitle: true,
      ),
      // Main layout using Column for vertical arrangement
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Title section
            _buildTitle(),

            // Results display section
            _buildResultsCard(),

            // Recalculate button
            _buildRecalculateButton(context),
          ],
        ),
      ),
    );
  }

  // Helper method to build the title section
  Widget _buildTitle() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.bottomCenter,
        child: const Text(
          'Your Result',
          style: kTitleTextStyle,
        ),
      ),
    );
  }

  // Helper method to build the results card
  Widget _buildResultsCard() {
    return Expanded(
      flex: 5, // Takes up 5x more space than other Expanded widgets
      child: ReusableCard(
        colour: kActiveCardColor,
        cardchild: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              resultText?.toUpperCase() ?? 'NO RESULT', // Null safety handling
              style: kResultTextStyle,
            ),
            Text(
              bmiResult ?? 'N/A', // Null safety handling
              style: kBMITextStyle,
            ),
            Text(
              interpretationText ??
                  'No interpretation available', // Null safety handling
              textAlign: TextAlign.center,
              style: kBodyTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the recalculate button
  Widget _buildRecalculateButton(BuildContext context) {
    return BottomButton(
      buttonTitle: 'RECALCULATE',
      onTap: () => Navigator.pop(context),
    );
  }
}
