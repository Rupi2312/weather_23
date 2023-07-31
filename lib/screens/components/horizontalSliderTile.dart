
import 'package:flutter/material.dart';

import '../constants/colors.dart';


class HorizontalSliderTile extends StatelessWidget {

  const HorizontalSliderTile({required this.index, required this.time, required this.iconData, required this.temperature}) ;
final String time;
final String iconData;
 final int index;
 final int temperature;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(time +"AM", style: TextStyle(fontSize: 11.0,),),
          SizedBox(height: 5.0,),
          Image.asset(
            iconData,  height: 20.0,
            width: 20.0,
          ),

          //TODO : make this icon from iconData string
          // Icon(Icons.cloud,size: 20.0,color: Colors.white,),
          SizedBox(height: 5.0,),
          Text(temperature.toString() +"°", style: ksmallTemperatureInSlider,),


        ],

      ),
    );
  }
}
