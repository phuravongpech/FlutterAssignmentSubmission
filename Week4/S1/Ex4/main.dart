import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Row(
          children: [
            WeatherForecastCard(
              day: Day.mon,
              temp: Temperature(min: 0, max: 20),
              weatherCondition: WeatherCondition.snow,
            ),
            SizedBox(
              width: 20,
            ),
            WeatherForecastCard(
              day: Day.fri,
              temp: Temperature(min: 100, max: 20),
              weatherCondition: WeatherCondition.rainy,
            ),
            SizedBox(
              width: 20,
            ),
            WeatherForecastCard(
              day: Day.wed,
              temp: Temperature(min: 100, max: 2020),
              weatherCondition: WeatherCondition.sunny,
            ),
          ],
        ),
      ),
    ),
  ));
}

enum Day { mon, tue, wed, thu, fri, sat, sun }

enum WeatherCondition { sunny, rainy, cloudy, snow }

extension DayExtension on Day {
  String get name {
    switch (this) {
      case Day.mon:
        return 'Monday';
      case Day.tue:
        return 'Tuesday';
      case Day.wed:
        return 'Wednesday';
      case Day.thu:
        return 'Thursday';
      case Day.fri:
        return 'Friday';
      case Day.sat:
        return 'Saturday';
      case Day.sun:
        return 'Sunday';
    }
  }
}

extension WeatherConditionExtension on WeatherCondition {
  IconData get icon {
    switch (this) {
      case WeatherCondition.sunny:
        return Icons.wb_sunny;
      case WeatherCondition.rainy:
        return Icons.beach_access;
      case WeatherCondition.cloudy:
        return Icons.wb_cloudy;
      case WeatherCondition.snow:
        return Icons.ac_unit;
    }
  }
}

class Temperature {
  final int min;
  final int max;

  const Temperature({required this.min, required this.max});
}

class WeatherForecastCard extends StatelessWidget {
  final Day day;
  final WeatherCondition weatherCondition;
  final Temperature temp;

  const WeatherForecastCard(
      {super.key,
      required this.day,
      required this.weatherCondition,
      required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20, top: 20),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(day.name),
          const SizedBox(height: 10),
          Icon(
            weatherCondition.icon,
            size: 30,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '${temp.min}\u00B0',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${temp.max}\u00B0 '),
            ],
          )
        ],
      ),
    );
  }
}
