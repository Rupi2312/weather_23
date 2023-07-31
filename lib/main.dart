import 'package:flutter/material.dart';
import 'package:weather_app_23/screens/MainPage.dart';
import 'package:weather_app_23/screens/components/inputPage.dart';
import 'package:weather_app_23/screens/components/loading_screen.dart';
import 'package:weather_app_23/screens/components/navbar.dart';
import 'package:weather_app_23/screens/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: blueSunny,

        sliderTheme: SliderTheme.of(context).copyWith(

            thumbShape:
            RoundSliderThumbShape(enabledThumbRadius: 1.0),
            overlayShape:
            RoundSliderOverlayShape(overlayRadius: 1.0),
            thumbColor: Color(0xFFEB1555),
            activeTrackColor: Colors.pink,

            inactiveTrackColor: Color(0xFF8D8E98),

      )),
      home:bottomNav()    ,
    );
  }
}

