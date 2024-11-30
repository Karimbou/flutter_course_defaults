import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // This class represents a reusable card that can be used in various parts of the app.
  // It has three properties: colour, cardchild, and onPress.
  const ReusableCard({
    super.key,
    required this.colour,
    this.cardchild,
    this.onPress,
  });
  // final makes the property immutable
  final Color colour;

  // Widget can't be null so the explicit non-null type ? is set
  final Widget? cardchild;
  // To make the function gives back a void which is the one we need you have to change Function to a defined Function called GestureTapCallback.
  // If you want to make sure that onPress is always a function with the correct signature, change its type to GestureTapCallback?:
  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardchild,
      ),
    );
  }
}
