import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:open_weather_widget/open_weather_widget.dart';

import 'constants/app_colors.dart';
import 'features/weather_page/current_weather.dart';
import 'features/weather_page/hourly_weather.dart';

class OpenWeatherMapAPI extends StatefulWidget {
  const OpenWeatherMapAPI({Key? key}) : super(key: key);

  @override
  State<OpenWeatherMapAPI> createState() => _OpenWeatherMapAPIState();
}

class _OpenWeatherMapAPIState extends State<OpenWeatherMapAPI> {
  @override
  Widget build(BuildContext context) {
    // String apiKey = "bdc31733796dbbeb750ad9bce5d73668";
    return Scaffold(
      body: SafeArea(
        child: openWeatherAPI(),
      ),
    );
  }

  Container weatherAPI() {
    return Container(
      width: 500,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.rainGradient,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(
              child: OpenWeatherWidget(
                latitude: 51.509865,
                longitude: -0.118092,
                location: "London",
                apiKey: "bdc31733796dbbeb750ad9bce5d73668",
                alignment: MainAxisAlignment.center,
                margin: EdgeInsets.all(5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container openWeatherAPI() {
    return Container(
      width: double.infinity,
      // height: 300,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.rainGradient,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            // Spacer(),
            CurrentWeather(),
            // Spacer(),
            HourlyWeather(),
            // Spacer(),
          ],
        ),
      ),
    );
  }

  MaterialApp weatherAPI3() {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Weather Widget"),
        ),
        body: const Center(
          child: OpenWeatherWidget(
            latitude: 51.5072,
            longitude: -0.1276,
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
