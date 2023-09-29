import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// TODO: Create Home screen.
class _HomeState extends State<Home> {
  static const _placeholder = Text(
    'Home Screen Placeholder',
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