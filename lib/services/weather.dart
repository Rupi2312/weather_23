



import 'package:weather_app_23/screens/MainPage.dart';
import 'package:weather_app_23/services/location.dart';
import 'package:weather_app_23/services/networking.dart';

const apiKey='9a23df3cd126eade2d3bc03815ccd327';
const apikey2= '204e9e7f204543a08b371b0bc637a5ce';

const apiKeyForTimeZone = '9MWM5BQ5U45Q';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    String cityname = "melbourne";
    //&city=Raleigh&country=US
    //  NetworkHelper networkHelper= NetworkHelper( 'https://api.weatherbit.io/v2.0/current?city=${cityname}&country=AU&key=$apikey2');

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.weatherbit.io/v2.0/current?lat=${location.latitude}&lon=${location.longitude}&key=$apikey2');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> get16DaysForecast() async {
    Location location = Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.weatherbit.io/v2.0/forecast/daily?lat=${location.latitude}&lon=${location.longitude}&key=$apikey2');

    //https://api.weatherbit.io/v2.0/forecast/hourly?city=Raleigh,NC&key=API_KEY&hours=48

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> get10hoursForecast() async {
    Location location = Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.weatherbit.io/v2.0/forecast/hourly?lat=${location.latitude}&lon=${location.longitude}&key=$apikey2&hours=48');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationByCityName(var cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }



}
