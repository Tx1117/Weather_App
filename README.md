# Weather App

A beautiful and modern weather application built with Flutter that fetches real-time weather data from OpenWeatherMap API.

## Features

- 🌤️ **Current Weather**: Display current temperature, weather conditions, humidity, wind speed, and more
- 📍 **Location-based Weather**: Get weather for your current location using GPS (mobile & desktop)
- 🔍 **City Search**: Search for weather information by city name
- 📅 **5-Day Forecast**: View weather forecast for the next 5 days
- 🎨 **Beautiful UI**: Modern gradient design with smooth animations
- 📱 **Multi-Platform Support**: Works on Web, Android, iOS, Windows, macOS, and Linux
- 🖥️ **Responsive Design**: Adapts to different screen sizes and orientations
- 🌐 **Cross-Platform**: Single codebase for all platforms

## Screenshots

The app features a beautiful gradient background with:
- Current weather card showing temperature, description, and weather icon
- Detailed weather information (high/low, humidity, wind speed)
- 5-day forecast in a horizontal scrollable list
- Search functionality to find weather by city
- Location button to get weather for current location

## Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- OpenWeatherMap API key (already included in the project)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd weather_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:

#### For Web:
```bash
flutter run -d chrome
```

#### For Android:
```bash
flutter run -d android
```

#### For iOS:
```bash
flutter run -d ios
```

#### For Windows:
```bash
flutter run -d windows
```

#### For macOS:
```bash
flutter run -d macos
```

#### For Linux:
```bash
flutter run -d linux
```

## Dependencies

- **http**: For making API calls to OpenWeatherMap
- **geolocator**: For getting current device location (mobile & desktop)
- **geocoding**: For reverse geocoding (coordinates to city name)
- **provider**: For state management
- **intl**: For date and number formatting
- **universal_platform**: For platform detection and cross-platform compatibility

## API Configuration

The app uses the OpenWeatherMap API with the following endpoints:
- Current Weather: `https://api.openweathermap.org/data/2.5/weather`
- 5-Day Forecast: `https://api.openweathermap.org/data/2.5/forecast`

The API key is already configured in the `WeatherService` class.

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── weather_data.dart     # Weather data models
├── providers/
│   └── weather_provider.dart # State management
├── screens/
│   └── weather_screen.dart   # Main weather screen
├── services/
│   └── weather_service.dart  # API service
├── utils/
│   ├── responsive_helper.dart # Responsive design utilities
│   └── platform_config.dart  # Platform-specific configurations
└── widgets/
    ├── weather_card.dart     # Current weather card
    ├── forecast_card.dart    # Forecast card
    └── search_bar.dart       # Search functionality
```

## Usage

### Web Platform
1. **Search for a City**: Use the search bar to enter a city name and press enter
2. **View Forecast**: Scroll horizontally through the 5-day forecast cards
3. **View Details**: The main card shows comprehensive weather information

### Mobile Platforms (Android/iOS)
1. **Search for a City**: Use the search bar to enter a city name and press enter
2. **Get Current Location**: Tap the location icon to get weather for your current location
3. **View Forecast**: Scroll horizontally through the 5-day forecast cards
4. **View Details**: The main card shows comprehensive weather information

### Desktop Platforms (Windows/macOS/Linux)
1. **Search for a City**: Use the search bar to enter a city name and press enter
2. **Get Current Location**: Tap the location icon to get weather for your current location (if supported)
3. **View Forecast**: Scroll horizontally through the 5-day forecast cards
4. **View Details**: The main card shows comprehensive weather information

## Features in Detail

### Current Weather Display
- Temperature in Celsius
- Weather description
- Feels like temperature
- High and low temperatures
- Humidity percentage
- Wind speed in m/s
- Weather icon from OpenWeatherMap

### 5-Day Forecast
- Daily weather predictions
- Temperature for each day
- Weather conditions
- Day of the week

### Location Services
- Automatic location detection
- Permission handling
- Reverse geocoding to get city names

## Platform Support

### Supported Platforms
- ✅ **Web**: Chrome, Firefox, Safari, Edge
- ✅ **Android**: API level 21+ (Android 5.0+)
- ✅ **iOS**: iOS 11.0+
- ✅ **Windows**: Windows 10+
- ✅ **macOS**: macOS 10.14+
- ✅ **Linux**: Ubuntu 18.04+, Debian 9+, etc.

### Platform-Specific Features
- **Location Services**: Available on mobile and desktop platforms
- **Responsive Design**: Adapts to different screen sizes and orientations
- **Touch Support**: Optimized for touch devices
- **Keyboard Support**: Full keyboard navigation on desktop platforms

## Error Handling

The app includes comprehensive error handling for:
- Network connectivity issues
- Invalid city names
- Location permission denials (platform-specific messages)
- API rate limiting
- Platform-specific limitations

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Acknowledgments

- OpenWeatherMap for providing the weather API
- Flutter team for the amazing framework
- The Flutter community for various packages used in this project
# Weather_App
