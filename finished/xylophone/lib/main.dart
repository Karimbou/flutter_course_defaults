import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: _buildTextButton('Tone C', Colors.red, 'note1.wav')),
                Expanded(
                    child:
                        _buildTextButton('Tone D', Colors.orange, 'note2.wav')),
                Expanded(
                    child:
                        _buildTextButton('Tone E', Colors.blue, 'note3.wav')),
                Expanded(
                    child:
                        _buildTextButton('Tone F', Colors.yellow, 'note4.wav')),
                Expanded(
                    child:
                        _buildTextButton('Tone G', Colors.green, 'note5.wav')),
                Expanded(
                    child:
                        _buildTextButton('Tone A', Colors.pink, 'note6.wav')),
                Expanded(
                    child:
                        _buildTextButton('Tone H', Colors.purple, 'note7.wav')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton _buildTextButton(String text, Color color, String sound) {
    final player = AudioPlayer();

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
      ),
      onPressed: () async {
        await player.play(AssetSource(sound));
      },
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
