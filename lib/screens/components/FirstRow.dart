

import 'package:flutter/material.dart';

class FirstRow extends StatelessWidget {
FirstRow({required this.cityName, required this.currentTemp,required this.currentWeather,required this.image_link});

String cityName;
int currentTemp;
String currentWeather;
String image_link;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cityName,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              currentTemp.toString() + "°",
              style: TextStyle(
                fontSize: 35.0,
              ),
            ),
            Text(
              currentWeather,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
        Image.asset(
          image_link,
          height: 200.0,
          width: 200.0,
        ),
      ]),
    );
  }
}