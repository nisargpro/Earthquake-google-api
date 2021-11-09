import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:networking_flutter/board_firestore/board_app.dart';
import 'package:networking_flutter/weather_forecast/weather_forecast.dart';


void main() =>
  runApp(new MaterialApp(
    home: WeatherForecast(),
  ));

