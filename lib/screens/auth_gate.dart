import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/auth_buttons.dart';
import '../widgets/user_info_card.dart';
import 'weather_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        return Scaffold(
          appBar: AppBar(title: const Text('Weather App')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthButtons(user: user),
                if (user != null) ...[
                  UserInfoCard(user: user),
                  const Expanded(child: WeatherScreen()),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
