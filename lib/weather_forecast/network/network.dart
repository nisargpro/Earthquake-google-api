import 'dart:convert';

import 'package:http/http.dart';
import 'package:networking_flutter/weather_forecast/model/weather_forecast_model.dart';
import 'package:networking_flutter/weather_forecast/util/forecast_util.dart';

class Network{
  Future<WeatherForecastModel> getWeatherForecast({required String cityname}) async {
    var finalurl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityname+
        "&units=metric&cnt=7&appid="+Util.appId+"";
    final response = await get(Uri.parse(finalurl));
    print("URL: ${Uri.parse(finalurl)}");

    if(response.statusCode == 200){

      print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));

    }else{
      throw Exception("error geting weather forecast");
    }

  }
}