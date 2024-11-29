import 'dart:math';

// Represents BMI calculation and interpretation with optimized code
class CalculatorMethod {
  // Constructor with required named parameters for height and weight
  // BMI is calculated once during initialization for better performance
  CalculatorMethod({required this.height, required this.weight})
      : bmi = _calculateInitialBMI(weight, height);

  // Input measurements
  final int height;
  final int weight;

  // Stored BMI value to avoid recalculation
  final double bmi;

  // Static helper method for initial BMI calculation
  static double _calculateInitialBMI(int weight, int height) {
    return weight / pow(height / 100, 2);
  }

  // Returns formatted BMI string with one decimal place
  String getBMI() => bmi.toStringAsFixed(1);

  // BMI category thresholds
  static const double _underweightThreshold = 18.5;
  static const double _overweightThreshold = 25.0;

  // Maps BMI ranges to corresponding result strings
  String getResult() {
    if (bmi >= _overweightThreshold) return 'Overweight';
    if (bmi > _underweightThreshold) return 'Normal Weight';
    return 'Underweight';
  }

  // Provides detailed health interpretation based on BMI value
  String getInterpretation() {
    if (bmi >= _overweightThreshold) {
      return 'Your BMI is too high. Exercise more I would suggest';
    }
    if (bmi > _underweightThreshold) return 'Nice! You have a normal weight.';
    return 'Your BMI indicates that your weight is too low. Please eat a bit more.';
  }
}
