class WeatherData {
  final double temperature;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final double humidity;
  final double windSpeed;
  final String icon;
  final String cityName;
  final DateTime dateTime;

  WeatherData({
    required this.temperature,
    required this.feelsLike,
    required this.low,
    required this.high,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
    required this.cityName,
    required this.dateTime,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      low: (json['main']['temp_min'] as num).toDouble(),
      high: (json['main']['temp_max'] as num).toDouble(),
      description: json['weather'][0]['description'],
      humidity: (json['main']['humidity'] as num).toDouble(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      icon: json['weather'][0]['icon'],
      cityName: json['name'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}

class WeatherForecast {
  final List<WeatherData> dailyForecast;

  WeatherForecast({required this.dailyForecast});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    List<WeatherData> forecast = [];

    for (var item in json['list']) {
      // For forecast data, we need to handle the city name differently
      var weatherItem = Map<String, dynamic>.from(item);
      weatherItem['name'] = json['city']['name']; // Add city name from parent
      forecast.add(WeatherData.fromJson(weatherItem));
    }

    return WeatherForecast(dailyForecast: forecast);
  }
}
