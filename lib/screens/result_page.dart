import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/constants/custom_designs/custom_designs.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.result,
      required this.bmi,
      required this.suggestion,
      required this.gender});
  final String result;
  final String bmi;
  final String suggestion;
  final Gender? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainScreenBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(
          'BMI Calculator',
          style: KHintTextStyle,
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: Center(
            child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const FaIcon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
          ),
        )),
      ),
      body: Column(
        children: [
          const SizedBox(height: 45),
          const Center(
            child: Text('Your Result', style: KTittleTextStyle),
          ),
          Expanded(
            child: Container(
              decoration: containerDecoration(radius: 15, blurness: 40),
              margin: const EdgeInsets.only(top: 5),
              child: ReusableCard(
                cardColor: KInactiveContainerColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(result.toUpperCase(),
                          style: KResultTextStyle(result)),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 35),
                          child: Text(bmi, style: KNumberTextStyle(size: 100))),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          suggestion,
                          style: KSuggestionTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: ResultButton(
                button: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const CustomColors().ButtonColor(gender),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: buttonContent('Re-Calculate'),
              ),
            )),
          )
        ],
      ),
    );
  }
}
