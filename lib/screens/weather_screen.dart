import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Gradient Header
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6A5AE0), Color(0xFF7F53AC)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Kebumen, Central Java, Indonesia',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '18°C',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/weatherpic.png',
                              width: 64,
                              height: 64,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '3:25 pm WIB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Forecast Section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Forecast',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height:
                          150, // Increased from 110 to 150 to prevent overflow
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          _ForecastCard(
                            time: 'Morning',
                            temp: '20°',
                            icon: Icons.wb_cloudy,
                            chance: '--',
                          ),
                          _ForecastCard(
                            time: 'Afternoon',
                            temp: '18°',
                            icon: Icons.cloud,
                            chance: '25%',
                          ),
                          _ForecastCard(
                            time: 'Evening',
                            temp: '16°',
                            icon: Icons.cloud_queue,
                            chance: '20%',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Segmented Control
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _SegmentButton(label: 'Weather', selected: true),
                    _SegmentButton(label: 'Wind'),
                    _SegmentButton(label: 'Precipitation'),
                  ],
                ),
              ),
              // Weather Info Cards
              Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    _InfoCard(
                      title: 'UV Index',
                      value: '5 of 10',
                      icon: Icons.wb_sunny,
                    ),
                    _InfoCard(
                      title: 'Humidity',
                      value: '70%',
                      icon: Icons.water_drop,
                    ),
                    _InfoCard(
                      title: 'High / Low',
                      value: '-- / 23',
                      icon: Icons.thermostat,
                    ),
                    _InfoCard(
                      title: 'Moon Phase',
                      value: 'Waning Gibbous',
                      icon: Icons.nightlight_round,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _ForecastCard extends StatelessWidget {
  final String time;
  final String temp;
  final IconData icon;
  final String chance;
  const _ForecastCard({
    required this.time,
    required this.temp,
    required this.icon,
    required this.chance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF1FB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Icon(icon, color: Color(0xFF6A5AE0), size: 32),
          const SizedBox(height: 8),
          Text(
            temp,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(chance, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final String label;
  final bool selected;
  const _SegmentButton({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: selected ? const Color(0xFFEEF2FB) : Colors.white,
            foregroundColor: const Color(0xFF6A5AE0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Color(0xFF6A5AE0), size: 28),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  const _NavBarItem({
    required this.icon,
    this.label = '',
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF6A5AE0) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(
                icon,
                color: selected ? Colors.white : const Color(0xFF6A5AE0),
              ),
              if (label.isNotEmpty) ...[
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    color: selected ? Colors.white : const Color(0xFF6A5AE0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
