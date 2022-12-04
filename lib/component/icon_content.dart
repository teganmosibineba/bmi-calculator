import 'package:flutter/material.dart';
import '../constant.dart';

// ignore: camel_case_types
class icons extends StatelessWidget {
  // ignore: non_constant_identifier_names
  icons({@required this.Symbols, this.mytext});

  // ignore: non_constant_identifier_names
  final IconData Symbols;
  final String mytext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Symbols,
          size: 80.0,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          mytext,
          style: kMytexttextstyle,
        )
      ],
    );
  }
}
