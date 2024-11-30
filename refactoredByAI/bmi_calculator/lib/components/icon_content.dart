import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
// Importing the constants file to use its kLabelTextStyle variable

class IconContent extends StatelessWidget {
  // This class represents a widget that displays an icon and a label
  const IconContent({super.key, required this.genderIcon, required this.label});

  final IconData? genderIcon;
  // The gender icon to be displayed
  final String label;
  // The label text to be displayed below the icon

  @override
  Widget build(BuildContext context) {
    return Column(
      // A column widget that arranges its children vertically
      mainAxisAlignment: MainAxisAlignment.center,
      // Centering the children of the column both horizontally and vertically
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        // An icon widget with the provided genderIcon and a fixed size of 80 pixels
        const SizedBox(
          height: 15.0,
        ),
        // A sized box widget that adds a vertical space of 15 pixels between the icon and the label
        Text(
          label,
          style: kLabelTextStyle,
        ),
        // A text widget with the provided label and using the kLabelTextStyle from the constants file
      ],
    );
  }
}
