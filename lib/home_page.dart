import 'package:bmi_finder/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_Card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'Bottom_button.dart';
import 'Round_Icon_Button.dart';

enum Gender{
  Male,
  Female,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Gender selectedGender;
  int height=180;
  int weight=20;
  int age=5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.Male;
                      });
                    },
                    colour:  selectedGender== Gender.Male ? kActiveCardColour: kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars, label: 'MALE',),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.Female;
                      });
                    },
                    colour: selectedGender== Gender.Female ? kActiveCardColour: kInactiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                  ),
                ),
              ], //children
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT', style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,),
                      Text(
                        'cm',
                        style: kLabelTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.redAccent,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98) ,
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider (
                        value: height.toDouble(),
                        min: 100,
                        max: 250,
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          });
                        }
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight', style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(), style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 20.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age'
                              '', style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(), style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 20.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ], //children
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              Calculator calc=Calculator(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText:calc.getResults(),
                  interpretation: calc.getIntersection() ,
                );
              }));

            },),
        ], //children
      ),
    );
  }
}





