// Main function that starts the Flutter app
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// Entry point of the application
void main() => runApp(const XylophoneApp());

// Root widget of the application
class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity:
            VisualDensity.adaptivePlatformDensity, // Adapts to platform density
      ),
      home: const XylophoneHome(), // Sets the home screen
    );
  }
}

// Main screen widget that contains the xylophone
class XylophoneHome extends StatefulWidget {
  const XylophoneHome({super.key});

  @override
  State<XylophoneHome> createState() => _XylophoneHomeState();
}

class _XylophoneHomeState extends State<XylophoneHome> {
  // Map to store audio players for each note
  final Map<String, AudioPlayer> _audioPlayers = {};

  // Function to play sound when a key is tapped
  Future<void> playSound(String sound) async {
    try {
      // Create new audio player if doesn't exist for this sound
      _audioPlayers.putIfAbsent(sound, () => AudioPlayer());

      // Stop any currently playing sound
      await _audioPlayers[sound]?.stop();

      // Play the new sound with low latency for better response
      await _audioPlayers[sound]?.play(
        AssetSource(sound),
        mode: PlayerMode.lowLatency,
      );
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }

  // Clean up resources when widget is disposed
  @override
  void dispose() {
    for (var player in _audioPlayers.values) {
      player.dispose();
    }
    super.dispose();
  }

  // Helper method to build individual xylophone keys
  Widget buildKey({
    required Color color,
    required String sound,
    required String note,
  }) {
    return Expanded(
      child: Material(
        // Added for better touch feedback
        color: color,
        child: InkWell(
          // Better touch handling than GestureDetector
          onTap: () => playSound(sound),
          child: Center(
            child: Text(
              note,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Each key represents a musical note
            buildKey(color: Colors.red, sound: 'note1.wav', note: 'NOTE C'),
            buildKey(color: Colors.orange, sound: 'note2.wav', note: 'NOTE D'),
            buildKey(color: Colors.blue, sound: 'note3.wav', note: 'NOTE E'),
            buildKey(color: Colors.yellow, sound: 'note4.wav', note: 'NOTE F'),
            buildKey(color: Colors.green, sound: 'note5.wav', note: 'NOTE G'),
            buildKey(color: Colors.pink, sound: 'note6.wav', note: 'NOTE A'),
            buildKey(color: Colors.purple, sound: 'note7.wav', note: 'NOTE B'),
          ],
        ),
      ),
    );
  }
}
