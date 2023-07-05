import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget? cardChild;
  final Function()? onPress;
  final Gender? gender;

  const ReusableCard({
    super.key,
    required this.cardColor,
    this.cardChild,
    this.onPress,
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: containerDecoration(radius: 20, cardColor: cardColor),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPress != null ? () => onPress!() : null,
          borderRadius: BorderRadius.circular(20),
          splashColor: gender == Gender.male
              ? Colors.blue[300]
              : gender == Gender.female
                  ? Colors.pink[300]
                  : KInactiveContainerColor,
          child: cardChild,
        ),
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.iconColor,
    required this.icon,
    required this.text,
  });

  final Color iconColor;
  final IconData icon;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 5),
        DecoratedIcon(
            icon: Icon(
          icon,
          color: iconColor,
          size: 80,
          shadows: const [
            Shadow(
              blurRadius: 10,
              offset: Offset(3, 2),
            ),
          ],
        )),
        text,
      ],
    );
  }
}

BoxDecoration containerDecoration({
  required double radius,
  Color? cardColor,
  double? blurness,
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    color: cardColor,
    boxShadow: <BoxShadow>[
      BoxShadow(
        offset: const Offset(2, -1),
        blurRadius: blurness ?? 5,
        spreadRadius: 3,
        color: const Color.fromARGB(92, 0, 0, 0),
      ),
    ],
  );
}

BoxDecoration flotingButtonShadow() {
  return const BoxDecoration(
    boxShadow: [
      BoxShadow(
          color: Color(0xff131f30),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 2)),
    ],
    shape: BoxShape.circle,
  );
}
