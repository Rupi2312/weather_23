import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  Color color;
  Widget cardChild;

  ReusableCard({required this.color, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: 15.0,left: 15.0,right: 15.0,bottom: 15.0),
      padding: EdgeInsets.only(top: 15.0,left: 15.0,right: 15.0,bottom: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: cardChild,
    );
  }
}
