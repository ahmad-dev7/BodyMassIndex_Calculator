import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  late double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getSuggestion() {
    if (_bmi >= 25) {
      return "Get a healthy BMI by making small, sustainable lifestyle changes like taking the stairs, going for a daily walk, and incorporating more physical activity into your routine.";
    } else if (_bmi > 18.5) {
      return "Keep Maintained a healthy BMI by eating a balanced diet and getting regular physical activity.";
    } else {
      return "To reach a healthy BMI, limit processed foods and sugary drinks and eat more whole, nutrient-dense foods like fruits, vegetables, and lean protein.";
    }
  }
}
