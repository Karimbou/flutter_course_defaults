// BMI Calculator Input Page
// This page handles user input for BMI calculation

import 'package:bmi_calculator/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import '../calculator_method.dart';

// Gender enum for selection state
enum Gender { female, male }

class InputPage extends StatefulWidget {
  final String title;
  const InputPage({super.key, required this.title});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // State variables
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

  // Helper method to build number adjustment controls
  Widget _buildAdjustmentControls(
      String label, int value, Function() onMinus, Function() onPlus) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: kLabelTextStyle),
        Text(value.toString(), style: klargeLabelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(icon: FontAwesomeIcons.minus, onpressed: onMinus),
            const SizedBox(width: 10.0),
            RoundIconButton(icon: FontAwesomeIcons.plus, onpressed: onPlus),
          ],
        )
      ],
    );
  }

  // Helper method to build gender selection card
  Widget _buildGenderCard(Gender gender, IconData icon, String label) {
    return Expanded(
      child: ReusableCard(
        onPress: () => setState(() => selectedGender = gender),
        colour:
            selectedGender == gender ? kActiveCardColor : kInactiveCardColor,
        cardchild: IconContent(genderIcon: icon, label: label),
      ),
    );
  }

  // Helper method to build height slider card
  Widget _buildHeightSlider() {
    return ReusableCard(
      colour: kActiveCardColor,
      cardchild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('HEIGHT', style: kLabelTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(height.toString(), style: klargeLabelTextStyle),
              const Text('cm', style: kLabelTextStyle)
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              inactiveTrackColor: const Color(0xFF8D8E98),
              thumbColor: const Color(0xffeb1555),
              overlayColor: const Color(0x29eb1555),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 18.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 35.0),
            ),
            child: Slider(
              value: height.toDouble(),
              min: 120.0,
              max: 220.0,
              onChanged: (double newValue) =>
                  setState(() => height = newValue.round()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Gender selection row
          Expanded(
            child: Row(
              children: [
                _buildGenderCard(Gender.male, FontAwesomeIcons.mars, 'MALE'),
                _buildGenderCard(
                    Gender.female, FontAwesomeIcons.venus, 'FEMALE'),
              ],
            ),
          ),
          // Height slider
          Expanded(child: _buildHeightSlider()),
          // Weight and age controls
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardchild: _buildAdjustmentControls(
                      'WEIGHT',
                      weight,
                      () => setState(() => weight--),
                      () => setState(() => weight++),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardchild: _buildAdjustmentControls(
                      'AGE',
                      age,
                      () => setState(() => age--),
                      () => setState(() => age++),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Calculate button
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              final calc = CalculatorMethod(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.getBMI(),
                    resultText: calc.getResult(),
                    interpretationText: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
