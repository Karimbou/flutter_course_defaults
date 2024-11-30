import 'package:flutter/material.dart';

// This class represents a custom round icon button widget.
class RoundIconButton extends StatelessWidget {
  // The icon to be displayed on the button.
  final IconData icon;

  // The callback function that will be called when the button is pressed.
  final GestureTapCallback? onpressed;

  // Constructor for creating a new instance of this class.
  const RoundIconButton(
      {super.key, required this.icon, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    // Returns a RawMaterialButton widget with the following properties:
    // - onPressed: The callback function that will be called when the button is pressed.
    // - elevation: The z-coordinate at which to place the button relative to its parent.
    // - constraints: A BoxConstraints object specifying the minimum and maximum size of the button.
    // - shape: A CircleBorder object specifying the shape of the button as a circle.
    // - fillColor: A Color object specifying the background color of the button.
    // - child: An Icon widget with the specified icon to be displayed on the button.
    return RawMaterialButton(
      onPressed: onpressed,
      elevation: 1.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
