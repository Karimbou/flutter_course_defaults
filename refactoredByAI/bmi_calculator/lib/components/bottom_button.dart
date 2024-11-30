import 'package:flutter/material.dart';
// Importing the constants file to use the kBottomContainerColor and kBbottomContainerHeight variables
import '../constants.dart';

class BottomButton extends StatelessWidget {
  // Defining a constructor for the BottomButton class that takes in two parameters: onTap and buttonTitle
  const BottomButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  final GestureTapCallback
      onTap; // A callback function that is executed when the button is tapped
  final String buttonTitle; // The text to be displayed on the button
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wrap the container with a GestureDetector widget to detect taps on the button
      onTap: onTap, // When the button is tapped, execute the onTap function
      child: Container(
        // Create a new container that will act as the button
        color:
            kBottomContainerColor, // Set the background color of the container to be kBottomContainerColor
        margin: const EdgeInsets.only(
            top: 10.0), // Add some top margin to the container
        padding: const EdgeInsets.only(
            bottom: 20.0), // Add some bottom padding to the container
        width: double
            .infinity, // Set the width of the container to be infinite (full width)
        height:
            kBbottomContainerHeight, // Set the height of the container to be kBbottomContainerHeight
        child: Center(
          // Center the text within the container
          child: Text(
            buttonTitle, // Display the buttonTitle text on the button
            style:
                kLargeButtonTextStyle, // Set the style of the text to be kLargeButtonTextStyle
          ),
        ),
      ),
    );
  }
}
