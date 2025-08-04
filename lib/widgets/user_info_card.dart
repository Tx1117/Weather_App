import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfoCard extends StatelessWidget {
  final User user;
  const UserInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        leading: user.photoURL != null
            ? CircleAvatar(backgroundImage: NetworkImage(user.photoURL!))
            : const CircleAvatar(child: Icon(Icons.person)),
        title: Text(user.displayName ?? 'No Name'),
        subtitle: Text(user.email ?? ''),
      ),
    );
  }
}
