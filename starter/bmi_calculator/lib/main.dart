import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});
  @override
  Widget build(BuildContext context) {
    const appName = "BMI Caluculator";
    return MaterialApp(
      title: appName,
      theme: ThemeData.dark(
        // I let this for you to know that we are you using Material 3. It is needed just for Flutter prior 3.16
        useMaterial3: true,
        // Theme code for Material 3 was changed. I hope this new template will meet the course requirements but the deafoult appareance is different
        // This is for a light Theme Z to use it you have to delete the .dark from ThemeData and uncomment
        // colorScheme: ColorScheme.fromSeed(
        //        seedColor: Colors.blue, brightness: Brightness.light)
        //    .copyWith(surfaceTint: Colors.blue),
        // appBarTheme: AppBarTheme(
        //     elevation: 4.0, shadowColor: Theme.of(context).colorScheme.shadow),
        //  textTheme: TextTheme(
        //    displayLarge:
        //          TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold)),
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
