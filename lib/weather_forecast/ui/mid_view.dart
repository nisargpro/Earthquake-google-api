import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:networking_flutter/weather_forecast/model/weather_forecast_model.dart';
import 'package:networking_flutter/weather_forecast/util/convert_icon.dart';
import 'package:networking_flutter/weather_forecast/util/forecast_util.dart';

class midView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  const midView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var city = snapshot.data!.city!.name;
    var country = snapshot.data!.city!.country;
    var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
    var forecast = forecastList[0];

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("$city,$country",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87
            ),),
            Text("${Util.getFormattedDate(formattedDate)}",style: TextStyle(
                fontSize: 15
            ),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(weatherDescription: forecastList[0].weather![0].main,
                  color: Colors.pinkAccent, size: 198),
            ),
            //Icon(FontAwesomeIcons.cloud,size: 198,color: Colors.pinkAccent,),
            //Icon(Icons.wb_sunny, size: 195,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${forecast.temp!.day!.toStringAsFixed(0)}°C",style: TextStyle(
                      fontSize: 34
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${forecast.weather![0].description!.toUpperCase()}"),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecast.speed!.toStringAsFixed(1)}kh/h"),
                        Icon(FontAwesomeIcons.temperatureHigh,size: 20,)
                        //Icon(Icons.arrow_forward,size: 30,color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecast.humidity!.toStringAsFixed(0)}%"),
                        Icon(FontAwesomeIcons.wind,size: 20,color: Colors.brown,)
                        //Icon(Icons.hot_tub,size: 20,color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecast.temp!.max!.toStringAsFixed(0)}°C"),
                        Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,color: Colors.brown,)
                        //Icon(Icons.wb_sunny,size: 20,color: Colors.brown,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Widget midView( AsyncSnapshot<WeatherForecastModel> snapshot){
//
//   Container midView = Container(
//     child: Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [Text("$city,$country",
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//           color: Colors.black87
//         ),),
//           Text("${Util.getFormattedDate(formattedDate)}",style: TextStyle(
//             fontSize: 15
//           ),),
//           SizedBox(height: 10,),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: getWeatherIcon(weatherDescription: forecastList[0].weather![0].main,
//                 color: Colors.pinkAccent, size: 198),
//           ),
//           //Icon(FontAwesomeIcons.cloud,size: 198,color: Colors.pinkAccent,),
//           //Icon(Icons.wb_sunny, size: 195,),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("${forecast.temp!.day!.toStringAsFixed(0)}°C",style: TextStyle(
//                   fontSize: 34
//                 ),),
//                 Text("${forecast.weather![0].description!.toUpperCase()}"),
//
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("${forecast.speed!.toStringAsFixed(1)}kh/h"),
//                       Icon(FontAwesomeIcons.temperatureHigh,size: 20,)
//                       //Icon(Icons.arrow_forward,size: 30,color: Colors.brown,)
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("${forecast.humidity!.toStringAsFixed(0)}%"),
//                       Icon(FontAwesomeIcons.wind,size: 20,color: Colors.brown,)
//                       //Icon(Icons.hot_tub,size: 20,color: Colors.brown,)
//                     ],
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.all(8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("${forecast.temp!.max!.toStringAsFixed(0)}°C"),
//                       Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,color: Colors.brown,)
//                       //Icon(Icons.wb_sunny,size: 20,color: Colors.brown,)
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//   );
//   return midView;
// }