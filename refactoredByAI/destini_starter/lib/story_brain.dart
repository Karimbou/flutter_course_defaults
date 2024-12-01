// Story class for a basic interactive storytelling game

// Import story class containing story data structure
import 'story.dart';

class StoryBrain {
  // Current position in story
  int _storyNumber = 0;

  // Collection of all story segments with their choices
  final List<Story> _storyData = [
    // Story 0 - Starting point
    Story(
      storyTitle:
          'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
      choice1: 'I\'ll hop in. Thanks for the help!',
      choice2: 'Better ask him if he\'s a murderer first.',
    ),
    // Story 1 - First branch
    Story(
      storyTitle: 'He nods slowly, unphased by the question.',
      choice1: 'At least he\'s honest. I\'ll climb in.',
      choice2: 'Wait, I know how to change a tire.',
    ),
    // Story 2 - Second branch
    Story(
      storyTitle:
          'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
      choice1: 'I love Elton John! Hand him the cassette tape.',
      choice2: 'It\'s him or me! You take the knife and stab him.',
    ),
    // Story 3 - Ending 1
    Story(
      storyTitle:
          'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
      choice1: 'Restart',
      choice2: '',
    ),
    // Story 4 - Ending 2
    Story(
      storyTitle:
          'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
      choice1: 'Restart',
      choice2: '',
    ),
    // Story 5 - Ending 3
    Story(
      storyTitle:
          'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
      choice1: 'Restart',
      choice2: '',
    ),
  ];

  // Getters for story elements
  String? getStory() => _storyData[_storyNumber].storyTitle;
  String? getChoice1() => _storyData[_storyNumber].choice1;
  String? getChoice2() => _storyData[_storyNumber].choice2;

  // Reset story to beginning
  void restart() => _storyNumber = 0;

  // Progress story based on player choice
  void nextStory(int choiceNumber) {
    // Story progression map for better readability
    final Map<int, Map<int, int>> storyFlow = {
      0: {1: 2, 2: 1},
      1: {1: 2, 2: 3},
      2: {1: 5, 2: 4},
    };

    // Check if current story number exists in progression map
    if (storyFlow.containsKey(_storyNumber)) {
      _storyNumber = storyFlow[_storyNumber]?[choiceNumber] ?? _storyNumber;
    } else {
      // Reset if we're at an ending (3, 4, or 5)
      restart();
    }
  }

  // Check if both choice buttons should be visible
  bool buttonAvaibility() => _storyNumber <= 2;
}
