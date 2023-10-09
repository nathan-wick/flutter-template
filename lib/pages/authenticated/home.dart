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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: const Center(
        child: _placeholder,
      ),
    );
  }
}