class BmiLogic {
  String calculateBmi(double mass, double height) {
    final bmiValue = mass / (height * height);
    return bmiValue.toStringAsFixed(2);
  }
}
