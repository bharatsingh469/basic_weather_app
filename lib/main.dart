import 'package:flutter/material.dart';
import 'package:the_mosam_app_01/repo.dart';
import 'package:the_mosam_app_01/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Weather App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(
              onPressed: () async {
                weatherModel = await Repo().getWeather(controller.text);
                print(weatherModel?.main?.temp??"Error");
                setState(() {
                   
                });
              },
              child: const Text('Search'),
            ),
            Text('Temp ${weatherModel?.main?.temp??"error"}'),
            Text('min temp ${weatherModel?.main?.tempMin??"Error"}'),
            Text('max temp ${weatherModel?.main?.tempMax??"Error"}'),
          ],
        ),
      ),
    );
  }
}
