import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthButtons extends StatelessWidget {
  final User? user;
  const AuthButtons({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return ElevatedButton.icon(
        icon: const Icon(Icons.login),
        label: const Text('Sign in with Google'),
        onPressed: () async {
          final userCred = await AuthService().signInWithGoogle();
          if (userCred != null) {
            await FirestoreService().addUser(
              userCred.user!.uid,
              userCred.user!.email!,
            );
          }
        },
      );
    } else {
      return ElevatedButton.icon(
        icon: const Icon(Icons.logout),
        label: const Text('Sign out'),
        onPressed: () async {
          await AuthService().signOut();
        },
      );
    }
  }
}
