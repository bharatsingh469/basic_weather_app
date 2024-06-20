import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_mosam_app_01/weather_model.dart';

class Repo {
  getWeather(String? city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=9400bf8f3bfad93911c22055136c5600";

    final res = await http.get(Uri.parse(url));

    var resBody = res.body;
    print(resBody);
    try {
      if (res.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(resBody));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
