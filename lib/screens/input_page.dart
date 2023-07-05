import 'package:bmi_calculator/calculate/calculate_bmi.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants/custom_designs/custom_designs.dart';
import 'package:bmi_calculator/constants/constants.dart';

//"none" assigned to remove the color from container if same gender is tapped twice
enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 170;
  int weight = 50;
  int age = 20;
  Gender? gender;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  gender: gender,
                  onPress: () {
                    setState(() {
                      gender == Gender.male
                          ? gender = Gender.none
                          : gender = Gender.male;
                    });
                  },
                  cardColor: gender == Gender.male
                      ? KActiveMaleContainerColor
                      : KInactiveContainerColor,
                  cardChild: Center(
                    child: IconContent(
                      icon: FontAwesomeIcons.person,
                      iconColor: gender == Gender.male
                          ? KActiveMaleColor
                          : KInactiveIconColor,
                      text: Text(
                        'Male',
                        style: KHintTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  gender: gender,
                  onPress: () {
                    setState(() {
                      gender == Gender.female
                          ? gender = Gender.none
                          : gender = Gender.female;
                    });
                  },
                  cardColor: gender == Gender.female
                      ? KActiveFemaleContainerColor
                      : KInactiveContainerColor,
                  cardChild: Center(
                    child: IconContent(
                      icon: FontAwesomeIcons.personDress,
                      iconColor: gender == Gender.female
                          ? KActiveFemaleColor
                          : KInactiveIconColor,
                      text: Text(
                        'Female',
                        style: KHintTextStyle,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  gender: gender,
                  cardColor: KLowerRowColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Height',
                        style: KHintTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(height.toString(), style: KNumberTextStyle()),
                          Text('cm', style: KHintTextStyle),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 14),
                            trackHeight: 6,
                            showValueIndicator: ShowValueIndicator.always,
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 35),
                            overlayColor:
                                const CustomColors().SliderThumbColor(gender)),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (value) => setState(() {
                            height = value.toInt();
                          }),
                          min: 120,
                          max: 220,
                          inactiveColor: Colors.grey,
                          activeColor: const CustomColors().sliderColor(gender),
                          onChangeEnd: (double newValue) {
                            height = newValue.toInt();
                          },
                          thumbColor: const Color.fromARGB(255, 212, 209, 209),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  gender: gender,
                  cardColor: KLowerRowColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Weight',
                        style: KHintTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const SizedBox(width: 20),
                          Text(weight.toString(), style: KNumberTextStyle()),
                          Text(
                            'kg',
                            style: KHintTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircularButtons(
                            onPress: () {
                              setState(() {
                                --weight;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                            gender: gender,
                          ),
                          CircularButtons(
                            onPress: () {
                              setState(() {
                                ++weight;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                            gender: gender,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  gender: gender,
                  cardColor: KLowerRowColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Age',
                        style: KHintTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: KNumberTextStyle(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircularButtons(
                            onPress: () {
                              setState(() {
                                age > 1 ? --age : age = 1;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                            gender: gender,
                          ),
                          CircularButtons(
                            onPress: () {
                              setState(() {
                                age < 99 ? ++age : age = 99;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                            gender: gender,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          ResultButton(
            button: ElevatedButton(
              onPressed: () {
                CalculatorBrain calculatedResult =
                    CalculatorBrain(height: height, weight: weight);
                setState(
                  () {
                    if (gender == Gender.male || gender == Gender.female) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            bmi: calculatedResult.calculateBmi(),
                            result: calculatedResult.getResult(),
                            suggestion: calculatedResult.getSuggestion(),
                            gender: gender,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const CustomColors().ButtonColor(gender),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: buttonContent('Calculate'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
