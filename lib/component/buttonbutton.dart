import 'package:flutter/material.dart';
import '../constant.dart';

import '../screens/input_page.dart';

class buttonbutton extends StatelessWidget {
  buttonbutton({@required this.onTap, @required this.buttontitle});

  final Function onTap;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: kButtomactivecardcolor,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: kBottumContainerheight,
          child: Center(
            child: Text(
              buttontitle,
              style: klargebuttontextstyle,
            ),
          )),
    );
  }
}
