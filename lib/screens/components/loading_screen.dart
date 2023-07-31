
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_23/screens/MainPage.dart';

import '../../services/weather.dart';

const apiKey='9a23df3cd126eade2d3bc03815ccd327';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



@override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocationData();

  }

  void getLocationData() async {


  WeatherModel weatherModel= WeatherModel();

  var weatherData= await weatherModel.getLocationWeather();


  var forecastData16Days = await weatherModel.get16DaysForecast();

  var forecastData10hours = await weatherModel.get10hoursForecast();


  Navigator.push(context, MaterialPageRoute(builder: (context){
    return MainPage(locationWeather: weatherData,forecastData16Days: forecastData16Days,forecastData10hours: forecastData10hours,);
  }));






  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 100.0,

        ),
      )
    );
  }
}
