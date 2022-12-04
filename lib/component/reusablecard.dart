import 'package:flutter/material.dart';

// ignore: camel_case_types
class reusablecard extends StatelessWidget {
  reusablecard({@required this.colour,  this.cardchild, this.onPress,});

  final Color colour;
  final Widget cardchild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardchild,
        //color: Color(0xff1d1e33),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color(0xff1d1e33), borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
