import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';
import '../models/weather_data.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherData? _currentWeather;
  List<WeatherData> _forecast = [];
  bool _isLoading = false;
  String? _error;
  String _currentCity = 'London'; // Default city

  WeatherData? get currentWeather => _currentWeather;
  List<WeatherData> get forecast => _forecast;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get currentCity => _currentCity;

  void setCity(String city) {
    _currentCity = city;
    notifyListeners();
  }

  Future<void> fetchWeatherByCity(String city) async {
    _setLoading(true);
    _clearError();

    try {
      _currentWeather = await WeatherService.getWeatherByCity(city);
      _currentCity = city;
      await fetchForecastByCity(city);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchWeatherByLocation() async {
    _setLoading(true);
    _clearError();

    try {
      final position = await WeatherService.getCurrentLocation();
      _currentWeather = await WeatherService.getWeatherByLocation(
        position.latitude,
        position.longitude,
      );

      final cityName = await WeatherService.getCityNameFromCoordinates(
        position.latitude,
        position.longitude,
      );
      _currentCity = cityName;

      await fetchForecastByCity(cityName);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchForecastByCity(String city) async {
    try {
      _forecast = await WeatherService.getForecastByCity(city);
    } catch (e) {
      _setError(e.toString());
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }
}
