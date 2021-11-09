import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:networking_flutter/weather_forecast/model/weather_forecast_model.dart';
import 'package:networking_flutter/weather_forecast/util/convert_icon.dart';
import 'package:networking_flutter/weather_forecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot, int index){
  var forecastList = snapshot.data!.list;
  var dayofweek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayofweek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayofweek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastList[index].weather![0].main, color: Colors.pinkAccent, size: 45),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("${forecastList[index].temp!.min!.toStringAsFixed(0)}c"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown,color: Colors.white,size: 17,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("${forecastList[index].temp!.max!.toStringAsFixed(0)}c"),
                    Icon(FontAwesomeIcons.solidArrowAltCircleUp,color: Colors.white,size: 17,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("hum:${forecastList[index].humidity!.toStringAsFixed(0)}%"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("win:${forecastList[index].speed!.toStringAsFixed(1)}kh/h"),
                    // Icon(FontAwesomeIcons.wind,color: Colors.white,size: 17,)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ],
  );
}