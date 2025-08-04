import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_data.dart';
import '../utils/responsive_helper.dart';

class WeatherCard extends StatelessWidget {
  final WeatherData weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          // City and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  weather.cityName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveHelper.getFontSize(context, 24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                DateFormat('MMM dd, yyyy').format(weather.dateTime),
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Temperature and Weather Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Temperature
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${weather.temperature.round()}°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.getFontSize(context, 48),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weather.description.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Feels like ${weather.feelsLike.round()}°C',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),

              // Weather Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Image.network(
                  'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Weather Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeatherDetail(
                icon: Icons.thermostat,
                label: 'High',
                value: '${weather.high.round()}°C',
              ),
              _buildWeatherDetail(
                icon: Icons.thermostat_outlined,
                label: 'Low',
                value: '${weather.low.round()}°C',
              ),
              _buildWeatherDetail(
                icon: Icons.water_drop,
                label: 'Humidity',
                value: '${weather.humidity.round()}%',
              ),
              _buildWeatherDetail(
                icon: Icons.air,
                label: 'Wind',
                value: '${weather.windSpeed.round()} m/s',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
