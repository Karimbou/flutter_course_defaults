import 'package:flutter/material.dart';
import 'package:navigation_demo/screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red, backgroundColor: Colors.redAccent),
          child: Text(
            'Go Forwards To Screen 2',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Screen2();
              }),
            );
          },
        ),
      ),
    );
  }
}
