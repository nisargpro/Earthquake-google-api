import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class JsonParsing extends StatefulWidget {
  const JsonParsing({Key? key}) : super(key: key);

  @override
  _JsonParsingState createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    print("$url");
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      // print(response.body[0]);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}