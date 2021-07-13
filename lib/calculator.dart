import 'dart:math';

class Calculator{
  Calculator({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi= weight/(pow(height/100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi>=25) {
      return 'Overweight';
    }
    else if(_bmi>18.5)
    {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }

  }

  String getIntersection(){
    if(_bmi>=25) {
      return 'You should eat less and exercise more. Start taking care of your body.';
    }
    else if(_bmi>18.5)
    {
      return 'You are healthy. Keep up the good work.';
    }
    else {
      return 'You should eat more and exercise on daily basis to start improving your health.';
    }
  }
}