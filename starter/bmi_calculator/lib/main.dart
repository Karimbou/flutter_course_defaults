import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});
  @override
  Widget build(BuildContext context) {
    const appName = "BMI Calculator";
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        // for flutter prior than 3.16 to use with Material 3
        useMaterial3: true,
        // Material 3 has a new way to deal with ColorSchemes / primaryColor will not work anymore
        colorScheme: ColorScheme.fromSeed(
                // the seedcolor sets the color of the scheme
                seedColor: Colors.blue,
                // define the default Brightness (light / dark)
                brightness: Brightness.light,
                dynamicSchemeVariant: DynamicSchemeVariant.fidelity)
            .copyWith(
          // surface sets the color for the background of the theme like background: Colors.
          surface: Colors.white,
          onSurface: Colors.blue,
          // surfaceContainerHigh: Colors.red
        ),
        // define your defaulf Text Theme to use your text styling
        textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(
              fontSize: 30.0,
            ),
            bodyMedium: TextStyle(
              fontSize: 20.0,
            )),
        appBarTheme: AppBarTheme(
          elevation: 4.0,
          shadowColor: Theme.of(context).colorScheme.shadow,
          // backgrondColor sets a custom color and overrides the one from the theme
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: InputPage(title: appName),
    );
  }
}

class InputPage extends StatefulWidget {
  final String title;
  const InputPage({Key? key, required this.title}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text('Body Text')),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}
