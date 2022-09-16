import 'package:flutter/material.dart';

import 'openweathermap.dart';

final Map<String, WidgetBuilder> map = {
  '/openweathermap': (BuildContext context) => OpenWeatherMapAPI(),
};
