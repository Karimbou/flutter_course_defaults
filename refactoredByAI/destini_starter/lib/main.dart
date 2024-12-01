// Main entry point that runs the app
import 'story_brain.dart';
import 'package:flutter/material.dart';

// Entry point that launches the Destini app
void main() => runApp(const Destini());

// Root widget of the application
class Destini extends StatelessWidget {
  const Destini({super.key}); // Constructor with named parameter
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // Set dark theme for the entire app
      home: const StoryPage(), // Set StoryPage as home screen
    );
  }
}

// Create single instance of StoryBrain to manage game state
final StoryBrain storyBrain = StoryBrain();

// Stateful widget for the main story page
class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

// State class that handles the UI and logic for StoryPage
class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background image container
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover, // Added to ensure proper image scaling
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          // Main content column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Story text section
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white, // Added for better visibility
                    ),
                  ),
                ),
              ),
              // First choice button (Red)
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white, // Fixed deprecated property
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    storyBrain.getChoice1(),
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0), // Spacing between buttons
              // Second choice button (Blue) - Conditionally visible
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonAvaibility(),
                  maintainSize: true, // Added to prevent layout shifts
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor:
                          Colors.white, // Fixed deprecated property
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBrain.getChoice2(),
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
