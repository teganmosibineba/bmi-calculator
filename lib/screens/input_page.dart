//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/icon_content.dart';
import '../component/reusablecard.dart';
import '../constant.dart';
import 'ResultPage.dart';
import '../component/buttonbutton.dart';
import '../component/Roundiconbutton.dart';
import 'package:bmi_calculator/calculatorbrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  /*
  Color maleCardColour = inactivecardcolor;
  Color femaleCardColour = inactivecardcolor;

  void updatecolour(Gender gender) {
    if ( 'selectedGender' == Gender.male) {
      if (maleCardColour == inactivecardcolor) {
        maleCardColour = activecardcolor;
        femaleCardColour = inactivecardcolor;
      } else {
        maleCardColour = inactivecardcolor;
      }
    }
    if ('selectedGender' == Gender.female) {
      if (femaleCardColour == inactivecardcolor) {
        femaleCardColour = activecardcolor;
        maleCardColour = inactivecardcolor;
      } else {
        femaleCardColour = inactivecardcolor;
      }
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: reusablecard(
                    colour: selectedGender == Gender.male
                        ? KActivecardcolor
                        : kInactivecardcolor,
                    cardchild: icons(
                      Symbols: FontAwesomeIcons.mars,
                      mytext: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: reusablecard(
                    colour: selectedGender == Gender.female
                        ? KActivecardcolor
                        : kInactivecardcolor,
                    cardchild: icons(
                      Symbols: FontAwesomeIcons.venus,
                      mytext: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: reusablecard(
              colour: KActivecardcolor,
              cardchild: Column(children: [
                Text(
                  'height',
                  style: kMytexttextstyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kThetextstyle),
                    Text(
                      'cm',
                      style: kMytexttextstyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xff8d8e98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x51eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 200.0,

                      //activeColor: Colors.white,

                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      }),
                )
              ]),
            ),
          ),
          Expanded(
              child: Row(children: [
            Expanded(
              child: reusablecard(
                colour: KActivecardcolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kMytexttextstyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kThetextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconbutton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            }),
                        SizedBox(
                          width: 5,
                        ),
                        // ignore: missing_required_param
                        RoundIconbutton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(children: [
              Expanded(
                child: reusablecard(
                  colour: KActivecardcolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kMytexttextstyle,
                      ),
                      Text(
                        age.toString(),
                        style: kThetextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: missing_required_param
                          RoundIconbutton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          SizedBox(
                            width: 2,
                          ),

                          RoundIconbutton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]))
          ])),
          buttonbutton(
            buttontitle: 'CALCULATOR',
            onTap: () {
              Calculatorbrain calc =
                  Calculatorbrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculatorbmi(),
                            resultText: calc.getResult(),
                            interpretation: calc.interpretation(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}

const klargebuttontextstyle =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
