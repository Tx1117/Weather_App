import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:universal_platform/universal_platform.dart';
import '../models/weather_data.dart';
import '../utils/platform_config.dart';

class WeatherService {
  static const String _apiKey = 'b15c76afaf3184e7d1802d56417c1527';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  // Get current weather by city name
  static Future<WeatherData> getWeatherByCity(String cityName) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/weather?q=$cityName&appid=$_apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Get current weather by coordinates
  static Future<WeatherData> getWeatherByLocation(
    double lat,
    double lon,
  ) async {
    final response = await http.get(
      Uri.parse(
        '$_baseUrl/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric',
      ),
    );

    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Get 5-day forecast by city name (daily average)
  static Future<List<WeatherData>> getForecastByCity(String cityName) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/forecast?q=$cityName&appid=$_apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Map<String, List<WeatherData>> grouped = {};
      for (var item in data['list']) {
        var weatherItem = Map<String, dynamic>.from(item);
        weatherItem['name'] = data['city']['name'];
        WeatherData forecast = WeatherData.fromJson(weatherItem);
        String dayKey = DateTime(
          forecast.dateTime.year,
          forecast.dateTime.month,
          forecast.dateTime.day,
        ).toIso8601String();
        grouped.putIfAbsent(dayKey, () => []).add(forecast);
      }
      // For each day, calculate the average
      List<WeatherData> dailyAverages = [];
      grouped.forEach((day, forecasts) {
        double avgTemp =
            forecasts.map((f) => f.temperature).reduce((a, b) => a + b) /
            forecasts.length;
        double avgFeelsLike =
            forecasts.map((f) => f.feelsLike).reduce((a, b) => a + b) /
            forecasts.length;
        double minTemp = forecasts
            .map((f) => f.low)
            .reduce((a, b) => a < b ? a : b);
        double maxTemp = forecasts
            .map((f) => f.high)
            .reduce((a, b) => a > b ? a : b);
        double avgHumidity =
            forecasts.map((f) => f.humidity).reduce((a, b) => a + b) /
            forecasts.length;
        double avgWind =
            forecasts.map((f) => f.windSpeed).reduce((a, b) => a + b) /
            forecasts.length;
        // Use the most common description and icon
        String description = forecasts[0].description;
        String icon = forecasts[0].icon;
        String cityName = forecasts[0].cityName;
        DateTime dateTime = forecasts[0].dateTime;
        dailyAverages.add(
          WeatherData(
            temperature: avgTemp,
            feelsLike: avgFeelsLike,
            low: minTemp,
            high: maxTemp,
            description: description,
            humidity: avgHumidity,
            windSpeed: avgWind,
            icon: icon,
            cityName: cityName,
            dateTime: dateTime,
          ),
        );
      });
      dailyAverages.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      return dailyAverages.take(5).toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  // Get current location
  static Future<Position> getCurrentLocation() async {
    // Check if platform supports location services
    if (!PlatformConfig.supportsLocationServices) {
      throw Exception(PlatformConfig.locationErrorMessage);
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  // Get city name from coordinates
  static Future<String> getCityNameFromCoordinates(
    double lat,
    double lon,
  ) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        return placemarks.first.locality ?? 'Unknown Location';
      }
      return 'Unknown Location';
    } catch (e) {
      return 'Unknown Location';
    }
  }
}
