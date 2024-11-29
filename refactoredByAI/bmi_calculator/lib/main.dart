import 'package:flutter/material.dart';
import 'screen/input_page.dart';
import 'constants.dart';

// Entry point of the application
void main() => runApp(const BMICalculator());

// BMICalculator is the root widget of our application
class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      // Configure the app-wide theme using Material 3
      theme: _buildAppTheme(),
      home: const InputPage(title: kAppName),
    );
  }

  // Separate theme configuration for better readability and maintenance
  ThemeData _buildAppTheme() {
    const primaryColorDark = Color(0xFF0A0E21);

    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      // Primary theme colors
      primaryColor: primaryColorDark,
      scaffoldBackgroundColor: primaryColorDark,

      // Additional theme customization can be added here
      // Example:
      // appBarTheme: const AppBarTheme(
      //   backgroundColor: primaryColorDark,
      //   elevation: 0,
      // ),
      // textTheme: const TextTheme(
      //   bodyMedium: TextStyle(fontSize: 16),
      //   titleLarge: TextStyle(fontSize: 24),
      // ),
    );
  }
}
