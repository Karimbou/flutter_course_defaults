import 'dart:math';

// Uses named parameters with required keyword, meaning both height and weight must be provided
// Uses an initializer list (the part after the :)
// Calculates BMI immediately during object initialization

class CalculatorMethod {
  CalculatorMethod({required this.height, required this.weight})
      : bmi = weight / pow(height / 100, 2);
  final int height;
  final int weight;
  final double bmi;

  String calculateBMI() {
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal Weight';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return 'Your BMI is too high. Exercise more I would suggest';
    } else if (bmi > 18.5) {
      return 'Nice! You have a normal weight.';
    } else {
      return 'Your BMI indicates that your weight is too low. Please eat a bit more.';
    }
  }
}
