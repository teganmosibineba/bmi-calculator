import 'dart:math';

class Calculatorbrain {
  Calculatorbrain({this.height, this.weight});

  final int height;
  final int weight;

  double bmi;

  String calculatorbmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'overweight';
    } else if (bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }
  String interpretation () {
    if (bmi >= 25) {
      return 'overweight';
    } else if (bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }

  }
}
