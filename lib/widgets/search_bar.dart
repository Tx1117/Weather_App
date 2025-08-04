import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherSearchBar extends StatefulWidget {
  const WeatherSearchBar({super.key});

  @override
  State<WeatherSearchBar> createState() => _WeatherSearchBarState();
}

class _WeatherSearchBarState extends State<WeatherSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _searchWeather() {
    if (_controller.text.trim().isNotEmpty) {
      context.read<WeatherProvider>().fetchWeatherByCity(
        _controller.text.trim(),
      );
      _controller.clear();
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search for a city...',
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: const Icon(Icons.search, color: Colors.white70),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, color: Colors.white70),
            onPressed: () {
              _controller.clear();
              _focusNode.unfocus();
            },
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
        onSubmitted: (_) => _searchWeather(),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
