// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_calculator/constants/custom_designs/custom_designs.dart';

Color KInactiveContainerColor = const Color(0xff1D2B3F);
Color KActiveMaleContainerColor = const Color.fromARGB(92, 87, 151, 255);
Color KActiveFemaleContainerColor = const Color.fromARGB(50, 255, 131, 180);
Color KMainScreenBackgroundColor = const Color(0xff0D1B2A);
Color kAppBarColor = const Color(0xff1E2A47);
Color KLowerRowColor = const Color(0xff1B2A3F);
Color KFloatingButtonColor = const Color(0xff20344f);
Color KInactiveButtonColor = const Color(0xff192c45);
Color KSecondryTextColor = const Color.fromARGB(255, 117, 117, 117);
Color KInactiveIconColor = Colors.grey;
Color KActiveMaleColor = Colors.blue;
Color KActiveFemaleColor = Colors.pink;
Color KMaleIconColor = KInactiveIconColor;
Color KFemaleIconColor = KInactiveIconColor;
Color KButtonColor = KInactiveButtonColor;

// Colors: SliderActive, SliderThumb, Button
class CustomColors extends InputPage {
  const CustomColors({super.key});
  Color sliderColor(gender) {
    return gender == Gender.male
        ? KActiveMaleColor
        : gender == Gender.female
            ? KActiveFemaleColor
            : const Color(0xFFBDBDBD);
  }

  Color SliderThumbColor(gender) {
    return gender == Gender.male
        ? const Color.fromARGB(255, 0, 132, 255)
        : gender == Gender.female
            ? const Color.fromARGB(255, 255, 0, 111)
            : Colors.grey;
  }

  Color ButtonColor(gender) {
    return gender == Gender.male
        ? KActiveMaleColor
        : gender == Gender.female
            ? KActiveFemaleColor
            : KInactiveButtonColor;
  }
}

class ResultButton extends StatelessWidget {
  const ResultButton({
    super.key,
    required this.button,
  });
  final Widget button;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      decoration: containerDecoration(radius: 10),
      child: button,
    );
  }
}

Widget buttonContent(String buttonText) {
  return Text(
    buttonText,
    style: GoogleFonts.rokkitt(
      fontSize: 30,
      wordSpacing: 3,
      shadows: [
        const BoxShadow(
          color: Colors.black,
          offset: Offset(0, 0),
          spreadRadius: 8,
          blurRadius: 10,
        )
      ],
    ),
  );
}

class CircularButtons extends StatelessWidget {
  const CircularButtons({
    super.key,
    required this.onPress,
    required this.icon,
    required this.gender,
  });

  final Function onPress;
  final IconData icon;
  final Gender? gender;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: flotingButtonShadow(),
      width: 65,
      height: 65,
      child: FloatingActionButton(
        splashColor: Colors.black,
        backgroundColor: gender == Gender.female
            ? KActiveFemaleContainerColor
            : gender == Gender.male
                ? KActiveMaleContainerColor
                : KFloatingButtonColor,
        onPressed: () {
          onPress();
        },
        child: FaIcon(
          icon,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}

TextStyle KNumberTextStyle({double? size}) {
  return TextStyle(
    fontSize: size ?? 50,
    fontWeight: FontWeight.w900,
    letterSpacing: 2,
    fontFamily: 'Lobster Two',
  );
}

final TextStyle KHintTextStyle = GoogleFonts.kalam(
  fontSize: 25,
  color: const Color.fromARGB(255, 210, 210, 210),
);

const TextStyle KTittleTextStyle = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.w100,
  color: Color.fromARGB(255, 224, 224, 224),
  fontFamily: 'Belanosima',
);

TextStyle KResultTextStyle(String result) {
  return TextStyle(
    fontSize: 30,
    color: result == 'Normal'
        ? Colors.green
        : const Color.fromARGB(255, 214, 199, 66),
    letterSpacing: 2,
    fontFamily: 'josefin sans',
    fontWeight: FontWeight.w100,
  );
}

const TextStyle KSuggestionTextStyle = TextStyle(
  letterSpacing: 1.1,
  height: 1.3,
  fontSize: 25,
  color: Color.fromARGB(255, 227, 225, 225),
  fontFamily: 'kalam',
);
