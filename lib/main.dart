import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: KMainScreenBackgroundColor),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          shadowColor: Colors.black,
          elevation: 5,
          title: Center(
            child: Text('BMI Calculator',
                style: GoogleFonts.capriola(
                  fontSize: 25,
                  wordSpacing: 5,
                )),
          ),
        ),
        body: const SafeArea(
          child: InputPage(),
        ),
      ),
    );
  }
}
