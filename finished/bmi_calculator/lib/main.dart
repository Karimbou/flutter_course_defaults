import 'package:flutter/material.dart';
import 'screen/input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData.dark(
        // for flutter prior than 3.16 to use with Material 3
        useMaterial3: true,
        // Material 3 has a new way to deal with ColorSchemes / primaryColor will not work anymore
        // The following is just apllicable when using the light theme by deleting the .dark

        // colorScheme: ColorScheme.fromSeed(
        // the seedcolor sets the color of the scheme
        // seedColor: Color(0xff0A0E21),
        // define the default Brightness (light / dark)
        // brightness: Brightness.light,
        // dynamicSchemeVariant: DynamicSchemeVariant.fidelity)
      ).copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // The following is just apllicable when using the light theme
        // textTheme: TextTheme(
        //  bodyMedium: TextStyle(color: Colors.white),
        // ),

        // surface sets the color for the background of the theme like background: Colors.
        // surface: Color(0xFF0A0E21),
        // onSurface: Colors.blue,
        // surfaceContainerHigh: Colors.red
      ),
      // define your defaulf Text Theme to use your text styling
      // textTheme: TextTheme(
      // displayLarge: TextStyle(
      // fontSize: 72.0,
      //fontWeight: FontWeight.bold,
      // ),
      // titleLarge: TextStyle(
      //  fontSize: 30.0,
      // ),
      //bodyMedium: TextStyle(fontSize: 20.0, color: Colors.white),
      //),
      // appBarTheme: AppBarTheme(
      // elevation: 4.0,
      //shadowColor: Theme.of(context).colorScheme.shadow,
      // backgrondColor sets a custom color and overrides the one from the theme
      // backgroundColor: Color(0xFF0A0E21),
      // titleTextStyle: TextStyle(
      //     color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
      // ),
      // ),
      home: InputPage(title: kAppName),
    );
  }
}
