import 'package:flutter/material.dart';
import 'package:open_weather_api_client/open_weather_api_client.dart';

// This example uses the Current Weather API endpoint
class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                // Setting up the weather factory
                CurrentWeatherFactory factory = CurrentWeatherFactory(
                  apiKey: "bdc31733796dbbeb750ad9bce5d73668",
                  settings: UnitSettings(
                    windSpeedUnit: WindSpeedUnit.Knots,
                  ),
                  cityName: "London",
                );

                // Requesting the weather
                RequestResponse<CurrentWeather?> result =
                    await factory.getWeather();

                // Checking if the request was successful
                if (result.requestStatus == RequestStatus.Successful) {
                  // Printing the city name from the server
                  print("cityName");
                  print(result.response!.cityName);
                  // Printing the temperature
                  print("temp");
                  print(result.response!.temp);
                  // Printing the weather type
                  print("weatherType");
                  print(result.response!.weatherType);
                } else {
                  // Printing the error that occurred
                  print("Error of type ${result.requestStatus} occurred");
                }
              },
              child: Container(
                width: 200,
                height: 100,
                alignment: Alignment.center,
                color: Colors.green,
                child: Text(
                  "Get Weather at London",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// This example uses the One Call API endpoint
class Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                // Setting up the weather factory
                OneCallWeatherFactory factory = OneCallWeatherFactory(
                  apiKey: "bdc31733796dbbeb750ad9bce5d73668",
                  settings: UnitSettings(
                    windSpeedUnit: WindSpeedUnit.Knots,
                  ),
                  locationCoords: LocationCoords(
                    longitude: 51.5074,
                    latitude: 0.1278,
                  ),
                  maxTimeBeforeTimeout: Duration(seconds: 10),
                );

                // Requesting the weather
                RequestResponse<OneCallWeather?> result =
                    await factory.getWeather();

                // Checking if the request was successful
                if (result.requestStatus == RequestStatus.Successful) {
                  // Printing the current weather type
                  print(result.response!.currentWeather!.weatherType);
                  // Printing the next hour's weather type
                  print(result.response!.hourlyWeather![1]!.weatherType);
                  // Printing the precipitation amount 30 minutes later
                  print(result
                      .response!.minutelyWeather![29]!.precipitationAmount);
                } else {
                  // Printing the error that occurred
                  print("Error of type ${result.requestStatus} occurred");
                }
              },
              child: Container(
                width: 200,
                height: 100,
                alignment: Alignment.center,
                color: Colors.blue,
                child: Text(
                  "Get Weather at London",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
