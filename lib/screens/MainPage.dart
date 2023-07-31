import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app_23/screens/components/ReusableCard.dart';
import 'package:weather_app_23/screens/components/UVIndex.dart';
import 'package:weather_app_23/screens/components/sunrise_sunset.dart';
import 'package:weather_app_23/screens/components/visibility.dart';
import 'package:weather_app_23/screens/constants/colors.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'components/FeelsLike.dart';
import 'components/FirstRow.dart';
import 'components/horizontalSliderTile.dart';
import 'components/squareTiles.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/standalone.dart' as tz;

String cityName = "San Franciso";
int currentTemp = 18;
String currentWeather = "Sunny";
String img_link = 'assets/images/icons8-night-48.png';

double min_temp = 10000.0;
double max_temp = -100000.0;

final Todays_day = DateTime.now();
final Todays_day_in_int = Todays_day.weekday;
double UVIndex_Level_num = 0;
String UVIndex_Level_String = "";
String UVIndex_Comment = "";
int Feels_temp = 0;
int preci_level = 0;
int visibility_km = 0;
String visibility_comment = "";
String sunrise_time = "";
String sunset_time = "";

DateTime nowTime = DateTime.now();

class MainPage extends StatefulWidget {
  MainPage(
      {this.locationWeather,
      this.forecastData16Days,
      this.forecastData10hours});

  final locationWeather;

  final forecastData16Days;
  final forecastData10hours;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);

    updateForecast15Days(widget.forecastData16Days);
  }

  void updateForecast15Days(dynamic forecastData16Days) {
    if (forecastData16Days == null) return;

    for (int i = 0; i < 16; i++) {
      double tempMin = forecastData16Days['data'][i]['min_temp'];

      double tempMax = forecastData16Days['data'][i]['max_temp'];

      if (tempMin <= min_temp) min_temp = tempMin;

      if (tempMax >= max_temp) max_temp = tempMax;
    }
  }

  //
  void updateUI(dynamic locationWeather) {
    if (locationWeather == null) {
      return;
    }

    cityName = locationWeather['data'][0]['city_name']; //data[0].city_name

    double temp =
        locationWeather['data'][0]['temp']; // data[0].app_temp  //data[0].temp
    currentTemp = temp.toInt();
    currentWeather = locationWeather['data'][0]['weather']
        ['description']; //data[0].weather.description

    String icon =
        locationWeather['data'][0]['weather']['icon']; //data[0].weather.icon

    img_link = updateImage(icon);

    UVIndex_Level_num = locationWeather['data'][0]['uv'];

    updateUVString(UVIndex_Level_num);

    Feels_temp = locationWeather['data'][0]['app_temp']
        .toInt(); //locationWeather['data'][0] //data[0].app_temp
    preci_level = locationWeather['data'][0]['precip'].toInt(); //data[0].precip

    visibility_km = locationWeather['data'][0]['vis'];
    updateVisibility_Comment(visibility_km); //data[0].vis
    sunrise_time = locationWeather['data'][0]['sunrise'];

    DateTime today = DateTime.now();
    String dateStr =
        today.toString().substring(0, 10) + " " + sunrise_time + ":00Z";
    var dateUS = DateTime.parse(dateStr).toLocal();
    sunrise_time = dateUS.hour.toString() + ":" + dateUS.minute.toString();

    sunset_time = locationWeather['data'][0]['sunset'];
    dateStr = today.toString().substring(0, 10) + " " + sunset_time + ":00Z";
    dateUS = DateTime.parse(dateStr).toLocal();
    sunset_time = dateUS.hour.toString() + ":" + dateUS.minute.toString();
  }

  void updateVisibility_Comment(int km) {
    if (km > 5) {
      visibility_comment = "Perfectly clear";
    } else
      visibility_comment = "Low visibility";
  }

  void updateUVString(double uvIndex) {
    if (uvIndex < 4.0) {
      UVIndex_Level_String = "Low";
      UVIndex_Comment = "UV Index is Low";
    } else if (uvIndex <= 7.0 && uvIndex >= 4.0) {
      UVIndex_Level_String = "Moderate";
      UVIndex_Comment = "Use sun protection 9AM-6PM";
    } else {
      UVIndex_Level_String = "Very High";
      UVIndex_Comment = "Use sun protection 9AM-6PM";
    }
  }

  String updateImage(String icon) {
    String image_name = "assets/icons/" + icon + ".png";

    return image_name;
  }

  String updateDay(int todaysDayInInt) {
    todaysDayInInt = todaysDayInInt % 7;

    if (todaysDayInInt == 1)
      return "Mon";
    else if (todaysDayInInt == 2)
      return "Tues";
    else if (todaysDayInInt == 3)
      return "Wed";
    else if (todaysDayInInt == 4)
      return "Thur";
    else if (todaysDayInInt == 5)
      return "Fri";
    else if (todaysDayInInt == 6)
      return "Sat";
    else
      return "Sun";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          FirstRow(
            cityName: cityName,
            currentTemp: currentTemp,
            currentWeather: currentWeather,
            image_link: img_link,
          ),
          Container(
            child: ReusableCard(
                color: bluediscriptions,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.forecastData10hours['data'][0]['weather']
                          ['description'],
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 100.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            String icon = widget.forecastData10hours['data']
                                    [index + 1]['weather']
                                ['icon']; //data[0].weather.icon
                            icon = updateImage(icon);

                            return HorizontalSliderTile(
                              index: index,
                              time: (DateTime.now()
                                      .add(Duration(hours: index + 1))
                                      .hour)
                                  .toString(),
                              iconData: icon,
                              temperature: (widget.forecastData10hours['data']
                                      [index + 1]['temp'])
                                  .toInt(),
                            );
                          }),
                    )
                  ],
                )),
          ),
          ReusableCard(
              color: bluediscriptions,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(
                      Icons.calendar_month,
                      size: 20.0,
                      color: Colors.grey,
                    ),
                    Text(
                      "10-Day ForeCast",
                      style: TextStyle(fontSize: 15.0, color: Colors.grey),
                    ),
                  ]),
                  Divider(),
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          double temp_min = widget.forecastData16Days['data']
                              [index + 1]['min_temp'];
                          int mintemp = temp_min.toInt(); // as int ;
                          double temp_max = widget.forecastData16Days['data']
                              [index + 1]['max_temp'];
                          int maxtemp = temp_max.toInt();
                          String icon = widget.forecastData16Days['data']
                              [index + 1]['weather']['icon'];
                          icon = updateImage(icon);

                          RangeValues _currentRangeValues =
                              RangeValues(temp_min, temp_max);

                          return Flexible(
                            child: Container(
                              height: 50.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    updateDay(Todays_day_in_int + index + 1),
                                    style: ksmallTemperatureInSlider,
                                  ),
                                  Image.asset(
                                    icon,
                                    height: 20.0,
                                    width: 40.0,
                                  ),
                                  Text(
                                    mintemp.toString() + "°",
                                    style: ksmallTemperatureInSlider,
                                  ),
                                  RangeSlider(
                                    max: max_temp,
                                    min: min_temp,
                                    values: _currentRangeValues,
                                    onChanged: (RangeValues value) {},
                                  ),
                                  Text(
                                    maxtemp.toString() + "°",
                                    style: ksmallTemperatureInSlider,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              )),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: Colors.blueAccent,
                        cardChild: UVIndex(
                          UvLevel_num: UVIndex_Level_num,
                          UvLevel_String: UVIndex_Level_String,
                          UvLevel_Comment: UVIndex_Comment,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: Colors.blueAccent,
                        cardChild: FeelsLike(
                          feels_temp: Feels_temp,
                          precip_level: preci_level,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                          color: Colors.blueAccent,
                          cardChild: visibility_level(
                            visibility_km: visibility_km,
                            visibililty_comment: visibility_comment,
                          )),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: Colors.blueAccent,
                        cardChild: Sunrise_sunset(
                          sunrise_time: sunrise_time,
                          sunset_time: sunset_time,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
