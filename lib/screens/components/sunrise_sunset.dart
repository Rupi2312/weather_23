import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';

class Sunrise_sunset extends StatelessWidget {
  const Sunrise_sunset({ required this.sunrise_time, required this.sunset_time}) ;


  final String sunrise_time ;
  final String sunset_time ;//="";




  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(

              mainAxisAlignment:  MainAxisAlignment.start,

              children: [
                Icon(CupertinoIcons.sun_dust_fill, size: 20.0, color: Colors.grey,),



                Text(  " SUNRISE" , style: TextStyle(
                    fontSize: 15.0,color: Colors.grey
                ),),
              ],
            ),
            SizedBox(height: 5.0,),



            Text(sunrise_time + "AM", style: TextStyle( fontSize: 30.0,  ),),

            SizedBox(height: 20.0,),
            Text( "Sunset: "+ sunset_time + "PM", style: TextStyle(fontSize: 15.0),)


          ],
        )
    );

  }
}
