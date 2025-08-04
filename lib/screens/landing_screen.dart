import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import 'auth_gate.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Color(0xFF1A1A2E), // Dark purple at top
              Color.fromARGB(255, 149, 24, 216), // Medium purple
              Color.fromARGB(255, 126, 48, 160), // Lighter purple at bottom
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top section with 3D weather icon
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Weather Icon Image
                      Container(
                        width: 200,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/weatherpic.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Title Text
                      const Column(
                        children: [
                          Text(
                            'Weather',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                          Text(
                            'App',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFD700),
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom section with button
              Expanded(
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD700),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFD700).withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () async {
                            final userCred = await AuthService()
                                .signInWithGoogle();
                            if (userCred != null) {
                              await FirestoreService().addUser(
                                userCred.user!.uid,
                                userCred.user!.email!,
                              );
                              if (context.mounted) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const AuthGate(),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.login,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
