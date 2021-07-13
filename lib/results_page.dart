import 'package:bmi_finder/constants.dart';
import 'package:bmi_finder/reusable_Card.dart';
import 'package:flutter/material.dart';
import 'Bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiResult, this.interpretation, this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results', style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultType,
                  ),
                  Text(
                    bmiResult,
                    style: kBMI,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBMITextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
