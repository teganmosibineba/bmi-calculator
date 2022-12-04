import 'package:flutter/material.dart';
import '../constant.dart';
import '../component/reusablecard.dart';
import 'package:bmi_calculator/component/buttonbutton.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult, @required this.interpretation, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'YOUR RESULTS',
              style: kresultpagetextstyle,
            ),
          )),
          Expanded(
            flex: 5,
            child: reusablecard(
                colour: KActivecardcolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: kresresulttextstyle,
                    ),
                    Text(
                     bmiResult,
                      style: kbmitextsrtyle,
                    ),
                    Text(
                      
                      interpretation,
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ),
          buttonbutton(
              onTap: () {
                Navigator.pop(context);
              },
              buttontitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
