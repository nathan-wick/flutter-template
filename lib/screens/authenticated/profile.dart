import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

// TODO: Create Profile screen.
class _ProfileState extends State<Profile> {
  static const _placeholder = Text(
    'Profile Screen Placeholder',
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _placeholder,
      ),
    );
  }
}