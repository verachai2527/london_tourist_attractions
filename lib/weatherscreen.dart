import 'package:flutter/material.dart';
import 'package:open_weather_widget/open_weather_widget.dart';

class OpenWeatherAPI extends StatelessWidget {
  OpenWeatherAPI({Key? key}) : super(key: key);
  String apiKey = "bdc31733796dbbeb750ad9bce5d73668";

  @override
  Widget build(BuildContext context) {
    return weatherAPI();
  }

  MaterialApp weatherAPI() {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Weather Widget"),
        ),
        body: const Center(
          child: OpenWeatherWidget(
            latitude: 51.509865,
            longitude: -0.118092,
            location: "London",
            height: 180,
            apiKey: "bdc31733796dbbeb750ad9bce5d73668",
            alignment: MainAxisAlignment.center,
            margin: EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }
}
