

import 'package:flutter/material.dart';


class FeelsLike extends StatelessWidget {
  const FeelsLike({ required this.feels_temp, required this.precip_level}) ;

  final int feels_temp;
  final int precip_level;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(

          mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Icon(Icons.thermostat_rounded, size: 20.0, color: Colors.grey,),

            Text(  " FEELS LIKE" , style: TextStyle(
                fontSize: 15.0,color: Colors.grey
            ),),
          ],
        ),

        Text(feels_temp.toString()+  "°", style: TextStyle( fontSize: 30.0,

        ),),

        SizedBox(height: 5.0,),
        Row(
          children: [
            Icon(Icons.water_drop,size: 25.0,),
            SizedBox(width: 5.0,),
            Text( precip_level.toString() + "%",style: TextStyle(fontSize: 25.0)),
          ],
        ),


      Text("Humidity Level",style: TextStyle(fontSize: 18.0))


      ],
    );

  }
}
