import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_data.dart';

class ForecastCard extends StatelessWidget {
  final WeatherData weather;

  const ForecastCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100, // Fixed height to prevent overflow
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            DateFormat('E').format(weather.dateTime),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Image.network(
                'https://openweathermap.org/img/wn/${weather.icon}.png',
                width: 32,
                height: 32,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${weather.temperature.round()}°C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
